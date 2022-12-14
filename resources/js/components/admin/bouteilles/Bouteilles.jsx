import React from "react";
import {
    List,
    Datagrid,
    TextField,
    useResourceDefinition,
    useRefresh,
    useNotify,
} from "react-admin";
import ListeActionsBouteilles from "./ListeActionsBouteilles";
import CustomDeleteBtn from "./CustomDeleteBtn";

function Bouteilles() {
    const { options } = useResourceDefinition();
    const refresh = useRefresh();
    const notify = useNotify();
    const hostOriginURL = window.location.origin;
    const importSAQ = async () => {
        return await axios.get(hostOriginURL + "/api/saq", {
            headers: {
                Authorization: "Bearer " + options.userAdmin["access_token"],
            },
        });
    };
    function gereImportSAQ() {
        importSAQ().then((response) => {
            console.log("retour de la SAQ : ",response);
            const bouteillesInserees =
                response.data["resultatInsertion"]["inserees"];
            const bouteillesRejetees =
                response.data["resultatInsertion"]["rejetees"];
            options.setBouteilles(response.data["bouteilles"]);
            refresh();
            notify(
                `Importation: ${bouteillesInserees} bouteille(s) insérée(s) et ${bouteillesRejetees} bouteille(s) rejetée(s)`
            );
        });
    }
    return (
        <React.Fragment>
            <List
                actions={
                    <ListeActionsBouteilles gereImportSAQ={gereImportSAQ} />
                }
            >
                <Datagrid
                    bulkActionButtons={
                        <CustomDeleteBtn
                            setBouteilles={options.setBouteilles}
                            bouteilles={options.bouteilles}
                        />
                    }
                >
                    <TextField source="id" />
                    <TextField source="nom_bouteille" />
                    <TextField source="code_saq" />
                    <TextField source="pays" />
                    <TextField source="description" />
                    <TextField source="prix_saq" />
                    <TextField source="format" />
                    <TextField source="degre_alcool" />
                    <TextField source="producteur" />
                    <TextField source="region" />
                    <TextField source="millesime" />
                </Datagrid>
            </List>
        </React.Fragment>
    );
}

export default Bouteilles;
