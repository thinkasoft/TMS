# -*- encoding: utf-8 -*-
###########################################################################
#    Module Writen to OpenERP, Open Source Management Solution
#
#    Copyright (c) 2014 Argil Consulting - http://www.argil.mx
############################################################################
#    Coded by: German Ponce Dominguez (german.ponce@argil.mx)

{
    "name": "TMS - EAN13 Automatico",
    "version": "1.0",
    "author": "Argil Consulting / German Ponce Dominguez",
    "category": "TMS",
    "description" : """
TMS - EAN13 Automatico
=========================

Este modulo te permite automatizar la captura de codigos EAN13 para productos
capturados como Refacciones.

Todo esto basado en una Secuencia llamada Secuencia para Refacciones.

La cual puedes adaptar antes de comenzar la captura.

    """,
    "website": "http://www.argil.mx/",
    "license": "AGPL-3",
    "depends": [
            "account",
            "tms",
            "tms_maintenance",
                ],
    "demo": [],
    "data": [
            "product.xml",
            "data.xml",
    ],
    "installable": True,
    "active": False,
}

# vim:expandtab:smartindent:tabstop=4:softtabstop=4:shiftwidth=4: