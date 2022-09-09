import React from "react";
import {
    List,
    Datagrid,
    TextField,
    TopToolbar,
    CreateButton,
    DateField,
    BooleanField,
} from "react-admin";
import ListeActionsBouteilles from "./ListeActionsBouteilles";

function Bouteilles() {
    const hostOriginURL = window.location.origin;

    const importSAQ = async () => {
        return await axios.get(hostOriginURL + "/api/saq");
    };

    function gereImportSAQ() {
        console.log("ouais!");
        importSAQ().then((response) => {
            console.log(response);
        });
    }
    return (
        <React.Fragment>
            <List
                actions={
                    <ListeActionsBouteilles gereImportSAQ={gereImportSAQ} />
                }
            >
                <Datagrid>
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
