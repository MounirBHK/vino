import React from "react";
import axios from "axios";
import { useState, useRef, useEffect, useContext } from "react";
import { useNavigate } from "react-router-dom";
import CelliersContext from "../../context/celliersContext";
import { Grid, TextField, Button } from "@mui/material";
import "./FormAjout.scss";

function FormAjoutCellier() {
    const celliersContext = useContext(CelliersContext);
    const [celliers, setCelliers] = celliersContext;
    const navigate = useNavigate();
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;

    const [libelle, setLibelle] = useState("");
    const [capacite, setCapacite] = useState("");

    const putNewCellier = async (newCellier) => {
        // console.log(newCellier);
        return await axios.post(
            hostOriginURL + "/api/ajouterCellier",
            newCellier,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const handleSubmit = (e) => {
        e.preventDefault();

        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            const newCellier = {
                id_user: userId,
                lib_cellier: libelle,
                capacite: parseInt(capacite),
            };

            putNewCellier(newCellier).then((response) => {
                setCelliers([...celliers, response.data]);
                navigate(`/dashboard/celliers`);
            });
        }
    };

    return (
        <div className="FormAjout">
            <h2>NOUVEAU CELLIER</h2>
            <form className="FormAjout" onSubmit={handleSubmit}>
                <Grid>
                    <Grid item xs={12}>
                        <TextField
                            className="textFieldAjout"
                            required
                            type="text"
                            name="libelle"
                            id="libelle"
                            label="Nom du cellier"
                            variant="outlined"
                            margin="dense"
                            value={libelle}
                            onChange={(e) => setLibelle(e.target.value)}
                        >
                            Recherche
                        </TextField>
                    </Grid>
                    <Grid item xs={12}>
                        <TextField
                            className="textFieldAjout"
                            required
                            type="number"
                            id="capacite"
                            name="capacite"
                            label="Capacité"
                            variant="outlined"
                            margin="dense"
                            value={capacite}
                            onChange={(e) => setCapacite(e.target.value)}
                        >
                            Capacité
                        </TextField>
                    </Grid>
                    <Grid className="validerAjout">
                        <Button variant="contained" type="submit">
                            Valider
                        </Button>
                    </Grid>
                </Grid>
            </form>
        </div>
    );
}

export default FormAjoutCellier;
