import React from "react";
import { dataProvider } from "../dataProvider";
import { useNotify, Button, useUnselectAll } from "react-admin";

function CustomDeleteBtn({ setBouteilles, bouteilles, resource, selectedIds }) {
    const notify = useNotify();
    const unselectAll = useUnselectAll(resource);
    const handleClick = () => {
        dataProvider
            .deleteMany("bouteilles", { ids: selectedIds })
            .then((response) => {
                const nbBouteillesSupp = response.data.length;
                notify(
                    `Suppression de ${nbBouteillesSupp} bouteille(s)  réussie`
                );
                unselectAll();
            })
            .catch((error) => {
                if (error.status == 405) {
                    notify(
                        "Suppression impossible: la ressource est utilisée par les usagers"
                    );
                    unselectAll();
                }
            });
    };
    return <Button label="Supprimer" onClick={handleClick}></Button>;
}

export default CustomDeleteBtn;
