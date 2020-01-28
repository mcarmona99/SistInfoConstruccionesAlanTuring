-- Triggers para evitar que se inserte o actualiza una fila en
-- Purchase_delivery_notes donde el NIF_P no coincida con el NIF_P de la factura
-- asociada a n_factura --> Miguel Moraga

CREATE DEFINER=`root`@`%` TRIGGER `construcciones_alan_turing_development`.`purchases_delivery_notes_BEFORE_INSERT` BEFORE INSERT ON `purchases_delivery_notes` FOR EACH ROW
BEGIN
	IF NEW.provider_id <> (SELECT provider_id FROM construcciones_alan_turing_development.purchase_invoices WHERE (id = NEW.purchase_invoice_id))
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se puede insertar la fila: proveedor del albarán no coincide con el proveedor de su factura';
	END IF;
END

-- Trigger para asegurar que las fechas de Working_workers tengan sentido, es
-- decir, que fecha_ini sea menor que fecha_fin --> Manuel Carmona

CREATE DEFINER=`root`@`%` TRIGGER `construcciones_alan_turing_development`.`working_workers_BEFORE_INSERT` BEFORE INSERT ON `working_workers` FOR EACH ROW
BEGIN
	IF NEW.fecha_ini > NEW.fecha_fin
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se puede actualizar la fila: la fecha de inicio no puede ser mayor que la de fin';
	END IF;
END

-- Triggers para asegurar que se esriban created_at y updated at de Providers --> Martin Garcia

CREATE DEFINER=`root`@`%` TRIGGER `construcciones_alan_turing_development`.`providers_BEFORE_INSERT` BEFORE INSERT ON `providers` FOR EACH ROW
BEGIN
	IF NEW.created_at = null THEN
		SET NEW.created_at = SELECT CURRENT_TIMESTAMP;
	END IF;
	
	IF NEW.updated_at = null THEN
		SET NEW.updated_at = SELECT CURRENT_TIMESTAMP;
	END IF;
END

-- Trigger que comprueba que no se solapen las fechas de un mismo trabajador en distintas obras --> Fernando Lojano

CREATE DEFINER=`root`@`%` TRIGGER `construcciones_alan_turing_development`.`working_workers_BEFORE_INSERT` BEFORE INSERT ON `working_workers` FOR EACH ROW
BEGIN
	DECLARE FechaInicTotal DATETIME;
    DECLARE FechaFinTotal DATETIME;
	SET @FechaInicTotal := (SELECT fecha_ini FROM working_workers WHERE (NEW.worker_id = working_workers.worker_id));
	SET @FechaFinTotal := (SELECT fecha_fin FROM working_workers WHERE (NEW.worker_id = working_workers.worker_id));

	IF !((NEW.fecha_ini < @FechaInicTotal && NEW.fecha_fin < @FechaFinTotal) || (NEW.fecha_ini > @FechaInicTotal && NEW.fecha_fin > @FechaFinTotal))

	THEN
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'El trabajador esta ocupado en el periodo seleccionado';
	END IF;
END

-- Trigger que comprueba que no se borra un cliente que tiene obras --> Jose Saldaña

CREATE DEFINER=`root`@`%` TRIGGER `construcciones_alan_turing_development`.`clients_BEFORE_DELETE` BEFORE DELETE ON `clients` FOR EACH ROW
BEGIN
	IF OLD.id = (SELECT client_id FROM construcciones_alan_turing_development.constructions WHERE (client_id = OLD.id))
	THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'No se puede borrar el cliente porque tiene asignada una obra';
	END IF;
END