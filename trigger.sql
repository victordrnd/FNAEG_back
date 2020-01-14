use fnaeg;

DELIMITER //
CREATE TRIGGER `status_validate` AFTER UPDATE
on fnaeg.commandes FOR EACH ROW
BEGIN
    DECLARE CodeKits VARCHAR(30);
    DECLARE Qtes INT;
    DECLARE done BOOLEAN;
    DECLARE cur CURSOR FOR SELECT CodeKit as CodeKits, Qte as Qtes FROM ligne_commandes where commande_id = NEW.id;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    IF NEW.status_id <> OLD.status_id AND new.status_id=2  THEN

        OPEN cur;
        ins_loop: LOOP
            FETCH cur INTO CodeKits, Qtes;
            IF done THEN
                LEAVE ins_loop;
            END IF;
            UPDATE fnaeg.kits set Stock=Stock+Qtes where CodeKit=CodeKits;
        END LOOP;
        CLOSE cur;
    END IF;
end//

DELIMITER ;