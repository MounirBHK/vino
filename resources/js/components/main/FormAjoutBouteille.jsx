import React from "react";
import axios from "axios";
import { useState, useEffect, useContext } from "react";
import {
    Grid,
    TextField,
    Select,
    MenuItem,
    FormControl,
    ListItem,
    Box,
    List,
    Divider,
} from "@mui/material";
import Bouteille from "./Bouteille";
import BouteillesContext from "../../context/bouteillesContext";
import { useNavigate } from "react-router-dom";
import "./FormAjout.scss";

function FormAjoutBouteille({ idCellierEnCours }) {
    let vi = idCellierEnCours ? idCellierEnCours : "default";
    const [idCell, setIdCell] = useState(vi);
    const navigate = useNavigate();
    const bouteilles = useContext(BouteillesContext);
    const [bouteillesCopie, setBouteillesCopie] = useState([]);
    const [celliers, setCelliers] = useState([]);
    const [libelle, setLibelle] = useState("");
    const [quantite, setQuantite] = useState(1);
    const [user, setUser] = useState(null);
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const [cellierSelected, setCellierSelected] = useState(null);

    const today = () => {
        var d = new Date().getDate();
        var day = d > 9 ? d : "0" + d;
        var m = new Date().getMonth() + 1;
        var month = m > 9 ? m : "0" + m;
        var year = new Date().getFullYear();
        return year + "-" + month + "-" + day;
    };

    const putBoutCell = async (refBout) => {
        return await axios.post(
            hostOriginURL + "/api/ajouterBouteilleCellier",
            refBout,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const getCelliers = async (userId) => {
        return await axios.get(hostOriginURL + "/api/celliers/user/" + userId, {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const handleBoutCell = (bouteille) => {
        if (idCell !== "default") {
            const refBout = {
                id_cellier: idCell,
                id_bouteille: bouteille.id,
                quantite: quantite,
                derniere_trans: today(),
            };
            putBoutCell(refBout).then((response) => {
                navigate(`/dashboard/celliers/${idCell}`, {
                    state: cellierSelected[0],
                });
            });
        } else alert("Vous n'avez pas sélectionné de cellier...");
    };

    const handleSubmit = (e) => {
        e.preventDefault();
    };

    function choixCellier(idCellier) {
        const userId = userLoggedIn.user.id;
        getCelliers(userId).then((response) => {
            setCellierSelected(
                response.data.filter((cellier) => cellier.id === idCellier)
            );
            setIdCell(idCellier);
        });
    }

    useEffect(() => {
        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            getCelliers(userId).then((celliersData) => {
                setCelliers(celliersData.data);
            });
        }
    }, [user]);

    useEffect(() => {
        if (idCell !== "default") {
            choixCellier(idCell);
        }
    }, []);

    useEffect(() => {
        setBouteillesCopie([]);
        let boutsRef = bouteilles;
        let res;
        if (!libelle) res = [];
        else
            res = boutsRef.filter(
                (bout) =>
                    bout.code_saq.includes(libelle) ||
                    bout.nom_bouteille
                        .toUpperCase()
                        .includes(libelle.toUpperCase()) ||
                    bout.description
                        .toUpperCase()
                        .includes(libelle.toUpperCase())
            );

        setBouteillesCopie(res);
    }, [libelle]);

    return (
        <div className="FormAjout">
            <h2>NOUVELLE BOUTEILLE</h2>

            <FormControl className="FormAjout">
                <Select
                    className="selectBar"
                    defaultValue={vi}
                    label="Selectionnez un cellier"
                    name="moncellier"
                    id="moncellier"
                    variant="outlined"
                    onChange={(e) => choixCellier(e.target.value)}
                >
                    <MenuItem
                        variant="outlined"
                        className="selectItem"
                        disabled
                        value={vi}
                    >
                        Sélectionner un cellier
                    </MenuItem>
                    {celliers.map((cellier) => {
                        return (
                            <MenuItem
                                className="selectItem"
                                key={cellier.id}
                                value={cellier.id}
                            >
                                {cellier.lib_cellier}
                            </MenuItem>
                        );
                    })}
                </Select>
            </FormControl>

            <form className="FormAjout" action="submit" onSubmit={handleSubmit}>
                <Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="text"
                            name="libelle"
                            id="libelle"
                            label="Mots-clés..."
                            variant="outlined"
                            margin="dense"
                            onChange={(e) => setLibelle(e.target.value)}
                        >
                            Recherche
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
                            onChange={(e) => setQuantite(e.target.value)}
                        >
                            Quantité
                        </TextField>
                    </Grid>
                </Grid>

                <label htmlFor="liste">
                    <Box className="bouteilles">
                        <Box>
                            <Divider>Liste des Bouteilles</Divider>
                            <List className="recherche">
                                {bouteillesCopie.map((bouteille) => (
                                    <ListItem
                                        divider
                                        key={bouteille.id}
                                        onClick={(e) =>
                                            handleBoutCell(bouteille)
                                        }
                                    >
                                        <Bouteille
                                            idCell={idCell}
                                            {...bouteille}
                                            quantite={quantite}
                                        />
                                    </ListItem>
                                ))}
                            </List>
                        </Box>
                    </Box>
                </label>
            </form>
        </div>
    );
}

export default FormAjoutBouteille;
