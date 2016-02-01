# -*- coding: utf-8 -*-

from report import report_sxw
from openerp.tools.translate import _
from report_webkit import report_helper
from report_webkit import webkit_report
from openerp.osv import fields, osv, orm
from datetime import datetime, timedelta
from openerp import SUPERUSER_ID
import openerp
import time
import sys
reload(sys)  
sys.setdefaultencoding('utf8')

class advance_report(report_sxw.rml_parse): # report_sxw es para decirle que va a tomar esa libreria de python
    def __init__(self, cr, uid, name,context=None): # Esta clase no genera nada en base de datos
        super(advance_report, self).__init__(cr, uid, name, context=context) # con super tomamos la clase super ya explicada anteriormente
        
        self.localcontext.update({ # un diccionario definido como localcontext que update va contener todos los parametros para nuestro reporte
            'time': time,
        })

report_sxw.report_sxw( 
    'report.tms.advance', #report.%s   donde %s es el nombre del reporte en el xml siempre va report mas el nombre de nuestra clase
    'tms.advance', # aqui es el nombre de la clase de nuestra clase session que contendra nuestro reporte
    'tms_reportess/Anticipos.rml',#addons/path_rml_del_xml la ruta de nuestro rml se encuentra en nuestro sxw
    parser=advance_report,# por ultimo un parse con el nombre de la clase
    header=False # le decimos que nuestra cabecera sea False
    )

class expense_report(report_sxw.rml_parse): # report_sxw es para decirle que va a tomar esa libreria de python
    def __init__(self, cr, uid, name,context=None): # Esta clase no genera nada en base de datos
        super(expense_report, self).__init__(cr, uid, name, context=context) # con super tomamos la clase super ya explicada anteriormente
        
        self.localcontext.update({ # un diccionario definido como localcontext que update va contener todos los parametros para nuestro reporte
            'time': time,
        })
    

report_sxw.report_sxw( 
    'report.tms.expense', #report.%s   donde %s es el nombre del reporte en el xml siempre va report mas el nombre de nuestra clase
    'tms.expense', # aqui es el nombre de la clase de nuestra clase session que contendra nuestro reporte
    'tms_reportess/Comprobacion.rml',#addons/path_rml_del_xml la ruta de nuestro rml se encuentra en nuestro sxw
    parser=expense_report,# por ultimo un parse con el nombre de la clase
    header=False # le decimos que nuestra cabecera sea False
)


class fuelvoucher_report(report_sxw.rml_parse): # report_sxw es para decirle que va a tomar esa libreria de python
    def __init__(self, cr, uid, name,context=None): # Esta clase no genera nada en base de datos
        super(fuelvoucher_report, self).__init__(cr, uid, name, context=context) # con super tomamos la clase super ya explicada anteriormente
        
        self.localcontext.update({ # un diccionario definido como localcontext que update va contener todos los parametros para nuestro reporte
            'time': time,
        })
    
    

report_sxw.report_sxw( 
    'report.tms.fuelvoucher', #report.%s   donde %s es el nombre del reporte en el xml siempre va report mas el nombre de nuestra clase
    'tms.fuelvoucher', # aqui es el nombre de la clase de nuestra clase session que contendra nuestro reporte
    'tms_reportess/Combustible.rml',#addons/path_rml_del_xml la ruta de nuestro rml se encuentra en nuestro sxw
    parser=fuelvoucher_report,# por ultimo un parse con el nombre de la clase
    header=False # le decimos que nuestra cabecera sea False
)


# REPORTE 2 CARTA PORTE
class tms_report_webkit_CP(report_sxw.rml_parse):
    def __init__(self, cr, uid, name, context):
        super(tms_report_webkit_CP, self).__init__(cr, uid, name, context=context)
        self.localcontext.update({
            'time': time,
            'get_serie': self._get_serie,
        })

    def _get_serie(self, o):
        serie = ''
        # if o.state in ('draft','cancel'):
        #     raise openerp.exceptions.Warning(_('Error!\nNo se puede Imprimir Cartas Porte en estado Borrado o Cancelado.\nConsulte a su Administrador.'))
        # else:
        serie = o.name
        return serie

report_sxw.report_sxw(
    'report.tms.waybill.webkit.CP',
    'tms.waybill',
    'tms_reportess/Cartaporte2.mako',
    parser=tms_report_webkit_CP,
    header=False
)
#

class maintenance_report(report_sxw.rml_parse):
    def __init__(self,cr,uid,name,context=None):
        super(maintenance_report,self).__init__(cr,uid,name,context=context)

        self.localcontext.update({
            'time':time
           
            
            })

report_sxw.report_sxw(
    'report.tms.maintenance.order',
    'tms.maintenance.order',
    'tms_reportess/mtto_report.rml',
    parser=maintenance_report,
    header=False,   
    )


class maintenance_driver(report_sxw.rml_parse): # report_sxw es para decirle que va a tomar esa libreria de python
    def __init__(self, cr, uid, name,context=None): # Esta clase no genera nada en base de datos
        super(maintenance_driver, self).__init__(cr, uid, name, context=context) # con super tomamos la clase super ya explicada anteriormente
        
        self.localcontext.update({ # un diccionario definido como localcontext que update va contener todos los parametros para nuestro reporte
            'time': time,
        })
    
report_sxw.report_sxw( 
    'report.tms.maintenance.driver', #report.%s   donde %s es el nombre del reporte en el xml siempre va report mas el nombre de nuestra clase
    'tms.maintenance.driver_report', # aqui es el nombre de la clase de nuestra clase session que contendra nuestro reporte
    'tms_reportess/mttoperador.rml',#addons/path_rml_del_xml la ruta de nuestro rml se encuentra en nuestro sxw
    parser=maintenance_driver,# por ultimo un parse con el nombre de la clase
    header=False # le decimos que nuestra cabecera sea False
)


class report_stock_picking(osv.osv):
    _name = 'report.stock.picking'
    _description = 'Albaranes Internos'
    _columns = {
        'name': fields.char('Herencia de Albaranes Internos', size=4),
        }

    _defaults = {
        }

    def init(self, cr,):
        report_obj = self.pool.get('ir.actions.report.xml')
        report_id = report_obj.search(cr, SUPERUSER_ID, [('report_file','=','stock/report/picking.rml')])
        if report_id:
            report_obj.write(cr, SUPERUSER_ID, report_id, {'report_file':'tms_reportess/vale.rml'})
        return True

report_stock_picking()
