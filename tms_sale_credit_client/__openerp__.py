# -*- encoding: utf-8 -*-
###########################################################################
#    Module Writen to OpenERP, Open Source Management Solution
#
#    Copyright (c) 2010 moylop260 - http://www.hesatecnica.com.com/
#    All Rights Reserved.
#    info skype: german_442 email: (german.ponce@hesatecnica.com)
############################################################################
#    Coded by: german_442 email: (german.ponce@hesatecnica.com)
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################
{
    'name': 'Limite de Credito para Ventas',
    'version': '1',
    "author" : "Argil Consulting",
    "category" : "TMS",
    'description': """
            Este modulo adapta la Facturacion Ligada con el campo Credito de Clientes.
            La Funcion Principal es que No se Pueda Validar Facturas por los siguiente Motivos:
                - Si el Cliente Tiene Facturas Vencidas.
                    --> Aqui se Toma en Cuenta Si la Factura ya esta Vencida por el campo Fecha de Vencimiento.
                - Si el Credito del Cliente Supera la Nueva Venta.
                - Si el Cliente tiene Cartas Porte a Facturar se toma en cuenta el Saldo.
            Excepciones:
                - Si el Pago es de Contado no afecta el Flujo.
                - Si se necesita Omitir una Factura Vencida, activar el Campo Ignorar Factura Vencida en la pestaña de cada Cliente.
                - Los Usuarios Que podran hacer uso del Asistente Anterior deberan estar en el Grupo [Ventas / Permisos Especiales] y su contraseña de Usuario.
            Seguridad:
                - Existe un Grupo Llamado Ventas / Permisos Especiales. El cual puede cambiar la Venta a Contado y Continuar el Proceso ó Puede Omitir Facturas Vencidas en Clientes.
    """,
    "website" : "http://www.argil.mx",
    "license" : "AGPL-3",
    "depends" : ["account","sale","purchase","account_voucher","account_accountant","tms"],
    "init_xml" : [],
    "demo_xml" : [],
    "update_xml" : [
                    "sale_view.xml",
                    "tms_view.xml",
                    'security/ir.model.access.csv',
                    ],
    "installable" : True,
    "active" : False,
}
