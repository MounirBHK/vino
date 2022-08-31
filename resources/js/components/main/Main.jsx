import React from "react";
import "./Main.scss";
import BouteillesContext from "../../context/bouteillesContext";
import { useContext } from "react";
import { Grid } from "@mui/material";
import CarteBouteille from "./CarteBouteille";

function Main({ gereQuantite }) {
    const bouteilles = useContext(BouteillesContext);
    return (
        <div>
            <h1>Main</h1>
            <ul>
                <Grid container spacing={2}>
                    {bouteilles.map((bouteille) => (
                        <Grid key={bouteille.id_bouteille} item xs={4}>
                            <CarteBouteille
                                imgUrlBouteille={bouteille.url_img}
                                nomBouteille={bouteille.nom_bouteille}
                                quantiteBouteille={bouteille.quantite}
                                paysBouteille={bouteille.pays}
                                typeBouteille={bouteille.type}
                                millesimeBouteille={bouteille.millesime}
                                prixBouteille={bouteille.prix_saq}
                                idCellier={bouteille.id_cellier}
                                idBouteille={bouteille.id_bouteille}
                                gereQuantite={gereQuantite}
                            />
                        </Grid>
                    ))}
                </Grid>
            </ul>
        </div>
    );
}

export default Main;
