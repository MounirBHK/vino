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
    const [codesaq, setCodesaq] = useState("");
    const [quantite, setQuantite] = useState(1);
    const [user, setUser] = useState(null);
    const hostOriginURL = window.location.origin;
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;

    const today = () => {
        var d = new Date().getDate();
        var day = d > 9 ? d : "0" + d;
        var m = new Date().getMonth() + 1;
        var month = m > 9 ? m : "0" + m;
        var year = new Date().getFullYear();
        return year + "-" + month + "-" + day;
    };

    // const [toInsertBout, setToInsertBout] = useState(refBout);

    const putBoutCell = async (refBout) => {
        // console.log(refBout);
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

    const getBouteillesDB = async () => {
        return await axios.get(hostOriginURL + "/api/bouteilles", {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    useEffect(() => {
        if (userLoggedIn) {
            const userId = userLoggedIn.user.id;
            getCelliers(userId).then((celliersData) => {
                setCelliers(celliersData.data);
            });
        }
    }, [user]);

    const getBouteillesCellier = async (idCellier) => {
        return await axios.get(hostOriginURL + "/api/cellier/" + idCellier, {
            headers: {
                Authorization: "Bearer " + userLoggedIn.access_token,
            },
        });
    };

    const handleSubmit = (e) => {
        e.preventDefault();
    };

    function choixCellier(idCellier) {
        setIdCell(idCellier);
    }

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

    const handleBoutCell = (bouteille) => {
        if (idCell !== "default") {
            const refBout = {
                id_cellier: idCell,
                id_bouteille: bouteille.id,
                quantite: quantite,
                derniere_trans: today(),
            };
            // console.log(refBout);
            putBoutCell(refBout).then((response) => {
                console.log("response ", response);
                navigate(`/dashboard/celliers/${idCell}`);
                // setCelliers(response);
            });
        } else alert("Vous n'avez pas sélectionné de cellier...");
    };

    return (
        <div className="FormAjout">
            <h2>NOUVELLE BOUTEILLE</h2>

            <FormControl className="FormAjout" sx={{ m: 1, minWidth: 250 }}>
                <Select
                    className="selectBar"
                    defaultValue={vi}
                    name="moncellier"
                    id="moncellier"
                    variant="outlined"
                    onChange={(e) => choixCellier(e.target.value)}
                >
                    <MenuItem className="selectItem" disabled value={vi}>
                        Sélectionner un cellier
                    </MenuItem>
                    {celliers.map((cellier) => {
                        return (
                            <MenuItem
                                className="selectItem"
                                key={cellier.id}
                                value={cellier.id}
                            >
                                {cellier.id} - {cellier.lib_cellier}
                            </MenuItem>
                        );
                    })}
                </Select>
            </FormControl>

            <form action="submit" onSubmit={handleSubmit}>
                <Grid>
                    <Grid item xs={12}>
                        <TextField
                            required
                            type="text"
                            name="libelle"
                            id="libelle"
                            label="Mots-clés..."
                            variant="filled"
                            margin="dense"
                            value={libelle}
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
                            variant="filled"
                            margin="dense"
                            value={quantite}
                            onChange={(e) => setQuantite(e.target.value)}
                        >
                            Quantité
                        </TextField>
                    </Grid>
                </Grid>

                <label htmlFor="liste">
                    <Box
                        className="bouteilles"
                    >
                        <Box sx={{ width: "100%", maxWidth: 500 }}>
                            <Divider>Liste des Bouteilles</Divider>
                            <List>
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

                            <Divider variant="fullWidth" />
                        </Box>
                    </Box>
                </label>
            </form>
        </div>
    );
}

export default FormAjoutBouteille;
