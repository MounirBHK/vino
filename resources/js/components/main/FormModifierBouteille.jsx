import React from "react";
import "./FormModifierBouteille.scss";
import { useNavigate } from "react-router-dom";
import { Grid, TextField, Button } from "@mui/material";

function FormModifierBouteille({ bouteille }) {
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const navigate = useNavigate();

    const putModifCellierBout = async (bouteille) => {
        // console.log(bouteille);
        return await axios.put(
            hostOriginURL + "/api/modifCellierBout",
            bouteille,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        bouteille.desc_bout = desc_bout.value;
        bouteille.quantite = quantite.value;
        //  maj bouteilles info

        putModifCellierBout(bouteille).then((response) => {
            const idCellier = response.data[0].id_cellier;
            const idBouteille = response.data[0].id_bouteille;

            navigate(`/dashboard/celliers/${idCellier}/${idBouteille}`, {
                state: bouteille,
            });
        });
    };

    return (
        <React.Fragment>
            <h2 className="modifierBoutCell-title">
                Modification d'une bouteille
            </h2>
            <h3 className="modifierBoutCell-subtitle">
                Cellier : {bouteille.id_cellier}
            </h3>
            <h3 className="modifierBoutCell-subtitle">
                Bouteille : {bouteille.id_bouteille}
            </h3>

            <form className="FormModif" action="submit" onSubmit={handleSubmit}>
                <Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="text"
                            name="desc_bout"
                            id="desc_bout"
                            label="Description"
                            variant="outlined"
                            margin="dense"
                            defaultValue={bouteille.desc_bout}
                        >
                            Description
                        </TextField>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="number"
                            id="quantite"
                            name="quantite"
                            label="Quantité"
                            variant="outlined"
                            margin="dense"
                            defaultValue={bouteille.quantite}
                        >
                            Quantité
                        </TextField>
                    </Grid>
                </Grid>
                <Button
                    type="submit"
                    className="modifBoutCell-btn"
                    variant="contained"
                >
                    Valider
                </Button>
                <Button
                    className="modifBoutCell-btn"
                    variant="contained"
                    onClick={() => {
                        history.back();
                    }}
                >
                    Annuler
                </Button>
            </form>
        </React.Fragment>
    );
}

export default FormModifierBouteille;
