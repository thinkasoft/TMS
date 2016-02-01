<html>

<head>
<style type="text/css">
        ${css}
    </style>
    <title>CARTA PORTE.pdf</title>
    <meta charset="UTF-8">
</head>
<body>

%for o in objects:
<% folio = get_serie(o) %>



<table style="font-size:55%" border="0" cellspacing="0">
	
	<tr>
		<td rowspan="3" width="20%"><img src="data:image/jpeg;base64,${o.company_id.logo}" style="max-width:100%;height:auto;"/></td>
		<td rowspan="4" colspan="3" width="60%"> <center><b>${o.shop_id.company_id.name or ''}</b></center>
		</td>
		<td bgcolor="black" colspan="2" width="20%"><font color="white"><center><b>Carta Porte: Translado</b></center></font></td>
	</tr>
	<tr>
		<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" colspan="2"><center>${folio or ''}</center></td>
	</tr>
	
    %if o.state  not in ('draft','cancel') and o.amount_total > 1 and o.partner_id.credit_limit > 0.0:
		
		<tr></tr><tr></tr>

		<tr>
			<td style="border-bottom:2px solid #000000" colspan="3" width="25%"><b>DOMICILIO FISCAL:</b>  ${o.shop_id.company_id.street or ''} ${o.shop_id.company_id.l10n_mx_street3 or ''} ${o.shop_id.company_id.l10n_mx_street4 or ''} ${o.shop_id.company_id.street2 or ''} ${o.shop_id.company_id.zip or ''} ${o.shop_id.company_id.city or ''} ${o.shop_id.company_id.state_id.name or ''} ${o.shop_id.company_id.country_id.name or ''}</td>
			<td style="border-bottom:2px solid #000000" colspan="3" width="20%"><center><b>R.F.C.</b>  ${o.shop_id.company_id.vat or ''}</center></td>
		</tr>

		<tr>
			<td style="border-bottom:2px solid #000000; border-left:2px solid #000000" colspan="3" width="50%"><b>LUGAR Y FECHA DE EXPEDICION:</b></td>
			<td style="border-bottom:2px solid #000000; border-right:2px solid #000000" colspan="3" width="50%">${o.shop_id.company_id.city or ''}, ${o.shop_id.company_id.state_id.name or ''} ${o.date_order or ''}</td>
		</tr>
	</tr>

	<tr>
		<td style="border-left:2px solid #000000" colspan="3" width="50%"><b>Cliente:</b> ${o.partner_id.name} </td>
		<td style="border-right:2px solid #000000" colspan="3" width="50%"><b>RFC:</b> ${o.partner_id.vat_split}</td>
		</tr>

		<tr>
		<td style="border-left:2px solid #000000" colspan="3" width="50%"><b>Direccion:</b> ${o.partner_id.street or ''} ${o.partner_id.l10n_mx_street3 or ''} </td>
		<td style="border-right:2px solid #000000" colspan="3" width="50%"><b>Colonia:</b> ${o.partner_id.street2 or ''}	</td>
		</tr>
		<tr>
		<td style="border-bottom:2px solid #000000; border-left:2px solid #000000" colspan="3" width="50%"><b>Ciudad y Edo:</b> ${o.partner_id.city or ''}, ${o.partner_id.state_id.name or ''}</td>
			
			<td style="border-bottom:2px solid #000000" colspan="2"><b>C.P.</b> ${o.partner_id.zip or ''}</td>
			<td style="border-bottom:2px solid #000000; border-right:2px solid #000000" colspan="1"><b>Tel:</b> ${o.partner_id.phone or ''}</td>
		</tr>


		<tr>
			<td style="border-left:2px solid #000000;border-right:2px solid #000000" colspan="3" width="50%"><b>ORIGEN:</b> ${o.departure_address_id.city or ''}, ${o.departure_address_id.state_id.name}</td>
			<td style="border-right:2px solid #000000" colspan="3" width="50%"><b>DESTINO:</b> ${o.arrival_address_id.city or ''}, ${o.arrival_address_id.state_id.name}</td>
		</tr>
		<tr>
			<td style="border-left:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>REMITENTE O EXPEDIDOR:</b> ${o.departure_address_id.name or ''}</td>
			<td style="border-right:2px solid #000000" colspan="3"><b>DESTINATARIO:</b> ${o.arrival_address_id.name or ''}</td>
		</tr>
		<tr>
			<td style="border-left:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>DOMICILIO:</b> ${o.departure_address_id.street or ''}</td>
			<td style="border-right:2px solid #000000" colspan="3"><b>DOMICILIO:</b> ${o.arrival_address_id.street or ''}</td>
		</tr>
		<tr>
			<td style="border-left:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>Colonia:</b> ${o.departure_address_id.street2 or ''}</td>
			<td style="border-right:2px solid #000000" colspan="3"><b>Colonia:</b> ${o.arrival_address_id.street2 or ''}</td>
		</tr>
		<tr>
			<td style="border-left:2px solid #000000" colspan="2"><b>Ciudad y Edo:</b> ${o.departure_address_id.city or ''}, ${o.departure_address_id.state_id.name or ''}<b>C.P.</b>${o.departure_address_id.zip or ''}</td>

			<td style="border-right:2px solid #000000" width="20%"><b>Tel:</b> ${o.departure_address_id.phone or ''}</td>
		
			<td colspan="2"><b>Ciudad y Edo:</b> ${o.arrival_address_id.city or ''}, ${o.arrival_address_id.state_id.name or ''} <b>C.P.</b> ${o.arrival_address_id.zip or ''}</td>
			<td style="border-right:2px solid #000000"><b>Tel:</b> ${o.arrival_address_id.phone or ''}</td>

		</tr>
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>SE RECOGERA EN:</b> ${o.upload_point or ''}</td>
			<td style="border-bottom:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>SE ENTREGARA EN:</b> ${o.download_point or ''}</td>
		</tr>
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>VALOR DECLARADO:</b> N/A</td>
			<td style="border-bottom:2px solid #000000;border-right:2px solid #000000" colspan="3"><b>FECHA O PLAZO PREVISTO DE ENTREGA:</b> ${o.date_appoint_down_sched or ''}</td>
		</tr>
	</table>



<!-- 2da tabla LISTO!-->
	<table style="font-size:60%" border="0" cellspacing="0">
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" rowspan="2" width="50%"><center><b>DESIGNACIÓN Y/O DESCRIPCIÓN D ELAS MERCANCIAS A TRANSPORTAR</td>
			<td style="border-bottom:2px solid #000000;border-right:2px solid #000000;border-left:2px solid #000000" colspan="3" width="50%"><center><b>ESTIMADOS</td>
		</tr>
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="16"><center><b>PESO</b></center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="16.6"><center><b>METROS CUBICOS</b></center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" width="16.6"><center><b>LITROS</b></center></td>
		</tr>
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="50"><center>
				%for p in o.waybill_shipped_product:
					${p.product_id.name or ''}
					${p.notes or ''}<br/>
				%endfor </center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="16"><center>
				%for p in o.waybill_shipped_product:
					${p.product_uom_qty or ''}<br/>
				%endfor </center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="16"><center> </center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000; border-right:2px solid #000000" width="16"><center> </center></td>
		</tr>
	</table>

<!-- 3RA TABLA -->
	<table style="font-size:55%" border="0" cellspacing="0">
		
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="17.5%"><center><b>CANTIDAD</b></center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="24.5"><center><b> UNIDAD DE MEDIDA</br> </b></center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="80%"><center><b>CONCEPTO O DESCRIPCIÓN DEL SERVICIO</b></center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" width="18%"><center><b>IMPORTE</b></center></td>
			
		</tr>
		
		<tr>
		
			<td valign="top" style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="17.5%"><center>1</center></td>
				
				<td valign="top" style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="24.5%"><center>N/A</center></td>
				<td valign="top" style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="80%"><center>FLETE</center></td>
				</td>
				<td valign="top" style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" width="18%"><center>$ 1.00<br/></center></td>
				</td>
		</tr>
		<!-- -->
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="50" colspan="2">
			<b>MATERIAL O RESIDUO PELIGROSO:</b>
			%if o.x_material:
				<input name="si" type="checkbox" checked="checked"/>SI
				<input name="no" type="checkbox" />NO
				%else:
					<input name="no" type="checkbox" />SI
					<input name="no" type="checkbox" checked="checked"/>NO
			%endif
			</td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" width="50" colspan="2">
			<center><b>ADJUNTAR TICKET (EN SU CASO)</b></center>
			</td>
		</tr>
	
	</table>

	<table  style="font-size:55%" border="0" cellspacing="0">
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="750"></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="95"><center><b>TOTAL</b></center></td>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" width="54"><center>$ 1.00</center></td>
		</tr>
	</table>

	
	<table style="font-size:55%" border="0" cellspacing="0">
		<tr>
			<td style="border-left:2px solid #000000;border-right:2px solid #000000" colspan="4"><b>Ruta:</b> 
				%for v in o.travel_ids:
					${v.route_id.departure_id.name or ''}    A    ${v.route_id.arrival_id.name or ''}
				%endfor</td>
			
							
		</tr>
							
		<tr>
						
			<td style="border-left:2px solid #000000;border-right:2px solid #000000" colspan="4"><b>Operador: </b> 
				%for v in o.travel_ids:
					${v.employee_id.name or ''}
				%endfor</td>
		</tr>

		<tr>
			%for v in o.travel_ids:
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000" width="180"><b>Carro:</b> ${v.unit_id.name or ''}<br><b>Placas:</b> ${v.unit_id.license_plate or ''}</td>
			<td style="border-bottom:2px solid #000000" width="180"><b>Remolque 1:</b> ${v.trailer1_id.name or ''}<br/><b>Placas:</b> ${v.trailer1_id.license_plate or ''} </td>
				%if v.dolly_id.name:
				<td style="border-bottom:2px solid #000000" width="180"><b>Dolly:</b> ${v.dolly_id.name or ''}<br/><b>Placas:</b> ${v.dolly_id.license_plate} </td>
				<td style=" border-bottom:2px solid #000000;border-right:2px solid #000000" width="180"><b>Remolque 2:</b> ${v.trailer2_id.name or ''}<br/><b>Placas 2:</b> ${v.trailer2_id.license_plate or ''}</td>
							
				%else:
				<td></td>
				<td style="border-bottom:2px solid #000000;border-right:2px solid #000000"> </td>

				%endif
		</tr>
			%endfor

						
	</table>

	<table style="font-size:55%" border="0" cellspacing="0">
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000" width="=1000"><b>INDEMNIZACIÓN:</b> (en su caso)</td>
		</tr>
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000 " width="1000"><b>OBSERVACIONES:</b></b>${o.notes or ''}</td>
		</tr>
	</table>

	<table style="font-size:55%" border="0" cellspacing="0">
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000 " width="1000"><center><b>RECIBI DE CONFORMIDAD</b><br/>______________________________________________<br/><b>Nombre y Firma de quien Recibe</b></center></td>
	</table>

	<table style="font-size:55%" border="0" cellspacing="0">
		<tr>
			<td style="border-bottom:2px solid #000000;border-left:2px solid #000000;border-right:2px solid #000000 " width="1000"><center><b>PERSONA MORAL DE REGIMEN SIMPLIFICADO CONFORME A LA LEY DE ISR</b><br/></center></td>
	</table>

		%else:
		

	%endif

	%endfor




<table style="font-size:50%" border="0">
<tr>
<td>
<center></br></br><b>CONTRATO DE PRESTACIÓN DE SERVICIOS QUE AMPARA ESTA CARTA DE PORTE</b></center>
</td>
</tr>
<tr>
<td align="justify">
PRIMERA.- Para los efectos del presente contrato de tranporte se denomina "porteador" al transportista y "Remitente" al usuario que contrate el servicio.
SEGUNDA.- El "Remitente" es reponsable de que la información proporcionada al "Porteador" sea veraz y que la documentación que entregue para efectis del transporte sea la correcta.
TERCERA.- El "Remitente debe declara al "Porteador" el tipo de mercancía o efectos de que se trate, peso, medidas y/o número de la carga que entrega para su transporte y, en su caso, el valor de la misma. La carga que se entregue a granel será pesada por el "Porteador" en el primer punto donde haya báscula apropiada o, en su defecto, aforada en metros cúbicos con la conformidad del "Remitente.
CUARTA.-  Para efectos del transporte, el "Remitente" deberá entregar al "Porteador" los documentos que las leyes y reglamentos exijan para llevar a cabo el servicio, en caso de no cumplirse con estos requisitos el "Porteador está obligado a rehusar el transporte de mercancías.
QUINTA,. Si por sospecha de falsedad en la declaracíon del contenido de un bulto el "Porteador" deseare proceder a su reconocmiento, podrá hacerlo ante testigos y con asistencia del "Remitente" o del consignatario. Si este último no concurriere, se solicitará la presencia de un inspector de la Secretaría de Comunicaciones y Transportes, y se levantará el acta correspondiente. El "Porteador" tendrá en todo caso la obligación de dejar los bultos en el esstado  en que se encontraban antes del conocimiento.
SEXTA- El "Porteador" deberá recoger y entregar la carga precisamente en los domicilios que señale el "Remitente", ajustándose a los términos y condiciones convenidos. El "Porteador" solo está obligado a llevar la carga al domicilio del consignatario para su entrega una sola vez. Si ésta no fuera recibida, se dejará aviso de que la mercancía queda a disposición del interesado en las bodegas que indique el "Porteador".
SEPTIMA.- Si la carga no fuere retirada dentro de los 30 días siguientes a aquél en que hubiere sido puesta a disposición del consignatario, el "Porteador" podría solicitar la venta en pública subasta con arreglo a lo que dispone el Código de Comercio
OCTAVA.- El "Porteador" y el "Remitente" negociarán libremente el precio del servicio, tomando en cuenta su tipo, característica de los embarques, volumen, regularidad, clase de carga y sistema de pago
NOVENA.- Si el "Remitente" desea que el "Porteador"asuma la responsabilidad por el valor de las mercancías o efecto que él declare hy que cubra toda clase de riesgos, inclusive los derivados de caso fortuito o de fuerza mayor, las partes deberán convenir un cargo adicional, equivalente al valor de la prima del seguro que se contrate, el cual se deberá expresar en la carta de porte.
DECIMA.- Cuando el importe de flete no incluya el cargo adicional, la responsabilidad del "Porteador" queda expresamente limitada a la cantidad equivalente a 15 días de salario mínimo vigente en el Distrito Federal por tonelada o cuando se trate de embarques cuyo peso sea mayor de 200kg. Pero menor de 1000kg; y a 4 días de salario mínimopor remewwsa cuando se trate de embarques con peso hasta 200kg.
DECIMA PRIMERA.- El precio del transporte deberá pagarse en origen, salvo convenio entre las partes de pago en destino. Cuando el transporte se hubiere concertado "Flete por Cobrar", la entrega de las mercancías o efectos se hará contra el pago del felte y el "Porteador" tendrá derecho a retenerlos mientras no se le cubrqa el precio convenido.
DECIMA SEGUNDA.- Si al momento de la entrega resultare algún faltante o avería, el consignatario deberá hacerla constar en ese acto en la carta de porte y formular su reclamación por escrito al "Porteador", dentro de las 24 horas siguientes
DECIMA TERCERA.- El "Porteador" queda eximido de la obligación de recibir mercanciás o efectos para su transporte, en los siguientes casos:
a) Cuando se trate de carga que por su naturaleza, peso, volumen, embalaje, defectuoso o cualquier otra circusntancia no pueda transportarse sin destruirse o sin causar daño a los demás artículos o el material rodante, salvo que la empresa de que se trate tenga el equipo adecuado.
b) Las mercancías cuyo transporte haya sido prohibido por disposiciones legales o reglamentarias. Cuando tales disposiciones no prohíban precisamente el transporte de determinadas mercancías, pero sí ordenen la presentación de ciertos documentos para que puedan ser transportadas, el "Remitente" estará obligado a entregar al "Porteador" los documentos correspondientes.
DECIMA CUARTA.- Los casos no previstos en las presentes condiciones y las quejas derivadas de su aplicación se someterán por la vía administrativa a la Secretaría de Comunicaciones y Transportes
DECIMA QUINTA.- Para el caso de que el "Remitente" contrate carro por entero, este aceptará la responsabilidad solidaria para que el "Porteador" mediante la figura de la corresponsabilidad QUE CONTEMPLA EL ARTICULO 10 DEL REGLAMENTO SOBRE EL PESO, DIMESIONES Y CAPACIDAD DE LOS VEHICULOS DE AUTOTRANSPORTE  que transitan en los caminos y puentes de jurisdicción federal, por lo que el "Remitente" queda oblicago a verificar que la carga y el vehículo que la transporta, cumplan con el peso y dimensiones máximas extablecidas en la Norma NOM-012-SCT-2-2008
Para el caso de incumplimiento e inobservancia a las dispociones que regulan el peso y dimensiones, por parte del "Remitente", este será corresponsable de las infracciones y multas de la Secretaría de Comunicaciones y Transportes
DEBO(EMOS) Y PAGARE (MOS) INCONDICIONALMENTE A LA ORDEN DE TRANSPORTES BELCHEZ, S.A. DE C.V. Y/O NELSON ARTURO BELCHEZ GONZALEZ EN LA CIUDAD DE VERACRUZ, VER, EL ________________ DE _________________ DEL_______________________ LA CANTIDAD DE _______________________________________________. LA FALTA DEL PAGO PUNTUAL DE ESTE PAGARE CAUSARA INTERESES MORATORIOS AL         % DESDE LA FECHA DE SU ACEPTACION A LA DE SU COBRO.
</td>
</tr>
<tr>
<td>
<center>
______________________________________________<br/>
Nombre y Firma de quien Recibe
</center>
</td>
</tr>
</table>

</body>

</html>
