# -*- encoding: utf-8 -*-
###########################################################################
#    Module Writen to OpenERP, Open Source Management Solution
#
#    Copyright (c) 2014 Argil Consulting - http://www.argil.mx
############################################################################
#    Coded by: German Ponce Dominguez (german.ponce@argil.mx)


from osv import osv, fields
import netsvc
from tools.translate import _
import time
from datetime import datetime, date, timedelta
from tools import DEFAULT_SERVER_DATE_FORMAT, DEFAULT_SERVER_DATETIME_FORMAT, float_compare
import decimal_precision as dp
from openerp import SUPERUSER_ID

class product_product(osv.osv):
    _name = 'product.product'
    _inherit ='product.product'
    _columns = {
    'seq_mant_id': fields.many2one('ir.sequence','Secuencia Refacciones'),
        }

    def _get_seq_mant(self, cr, uid, context=None):
        seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
        seq_id = seq_id[0] if seq_id else False
        return seq_id

    _defaults = {
    'seq_mant_id': _get_seq_mant,
        }

    def write(self, cr, uid, ids, vals, context=None):
        self_br = self.browse(cr, uid, ids, context)[0]
        ean13_lot = ""
        if 'tms_category' in vals:
            tms_category = vals['tms_category']
            if tms_category == 'maint_part':
                if 'ean13' in vals:
                    ean13 = vals['ean13']
                    if ean13 == False or ean13 == '':
                        seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
                        ean13_lot = self.pool.get('ir.sequence').get_id(cr, uid, seq_id[0])
                        vals.update({'ean13':ean13_lot})
                else:
                    seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
                    ean13_lot = self.pool.get('ir.sequence').get_id(cr, uid, seq_id[0])
                    vals.update({'ean13':ean13_lot})
                if 'default_code' in vals:
                    default_code = vals['default_code']
                    if default_code == False or default_code == '':
                        vals.update({'default_code': ean13_lot})
                else:
                    vals.update({'default_code': ean13_lot})
        else:
            if self_br.tms_category == 'maint_part':
                if not self_br.ean13:
                    seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
                    ean13_lot = self.pool.get('ir.sequence').get_id(cr, uid, seq_id[0])
                    vals.update({'ean13':ean13_lot})
                    vals.update({'default_code': ean13_lot})
        res = super(product_product, self).write(cr, uid, ids, vals, context=None)
        return res

    def create(self, cr, uid, vals, context=None):
        if 'tms_category' in vals:
            tms_category = vals['tms_category']
            if tms_category == 'maint_part':
                ean13_lot = ""
                if 'ean13' in vals:
                    ean13 = vals['ean13']
                    if ean13 == False or ean13 == '':
                        seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
                        ean13_lot = self.pool.get('ir.sequence').get_id(cr, uid, seq_id[0])
                        vals.update({'ean13':ean13_lot})
                else:
                    seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
                    ean13_lot = self.pool.get('ir.sequence').get_id(cr, uid, seq_id[0])
                    vals.update({'ean13':ean13_lot})
                if 'default_code' in vals:
                    default_code = vals['default_code']
                    if default_code == False or default_code == '':
                        vals.update({'default_code': ean13_lot})
                else:
                    vals.update({'default_code': ean13_lot})


        return super(product_product, self).create(cr, uid, vals, context=context)

    def copy(self, cr, uid, id, default={}, context=None):
        self_br = self.browse(cr, uid, id, context)
        ean13_lot = ""
        if self_br.ean13:
            ean13 = self_br.ean13
            default_code = self_br.default_code
            if ean13:
                if self_br.tms_category:
                    tms_category = self_br.tms_category
                    if tms_category == 'maint_part':
                        seq_id = self.pool.get('ir.sequence').search(cr, uid, [('code','=','secuencia.refacciones.tms')])
                        ean13_lot = self.pool.get('ir.sequence').get_id(cr, uid, seq_id[0])
                        default_code = ean13_lot
                    else:
                        ean13_lot = ean13+" (Copia)"
                        default_code = default_code+" (Copia)"
                else:
                    ean13_lot = ean13+" (Copia)"
                    default_code = default_code + " (Copia)"
            default.update({
            'ean13':ean13_lot,
            'default_code': default_code,
                        })
        res = super(product_product, self).copy(cr, uid, id, default, context)
        return res

    def _check_ean13(self, cr, uid, ids, context=None):        
        self_br = self.browse(cr, uid, ids, context)[0]
        if not self_br.ean13:
            return True
        user_br = self.pool.get('res.users').browse(cr, uid, uid, context)
        company_ids = self.pool.get('res.company').search(cr, SUPERUSER_ID, [])
        if len(company_ids) > 1:
            cr.execute("""
                    select id from product_product 
                    where UPPER(ean13)='%s' and id != %s
                    and company_id != %s;
                        """ % (self_br.ean13.upper(), ids[0], user_br.company_id.id,))
            cr_res = cr.fetchall()
            if cr_res:
                partner_ids = [x[0] for x in cr_res if x]
                if partner_ids:
                    return False
        else:
            cr.execute("""
                select id from product_product 
                where UPPER(ean13)='%s' and id != %s;
                    """ % (self_br.ean13.upper(), ids[0],))
            cr_res = cr.fetchall()
            if cr_res:
                partner_ids = [x[0] for x in cr_res if x]
                if partner_ids:
                    return False
        return True

    _constraints = [(_check_ean13, 'Error: El campo EAN13 debe ser unico para cada Producto.', ['EAN13']), ] 