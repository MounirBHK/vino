import React from "react";
import { Grid } from "@mui/material";
import { useContext } from "react";
import CarteBouteille from "./CarteBouteille";
import BouteillesContext from "../../context/bouteillesContext";
import "./Cellier.scss";

function Cellier({ gereQuantite }) {
    const bouteilles = useContext(BouteillesContext);
    return (
        <ul>
            <Grid container spacing={2}>
                {bouteilles.map((bouteille) => (
                    <Grid key={bouteille.id_bouteille} item xs={4}>
                        <CarteBouteille
                            bouteille={bouteille}
                            gereQuantite={gereQuantite}
                        />
                    </Grid>
                ))}
            </Grid>
        </ul>
    );
}

export default Cellier;
