import React from "react";
import { Grid } from "@mui/material";
import CarteBouteille from "./CarteBouteille";
import "./Cellier.scss";

function Cellier({ gereQuantite, bouteillesCellier }) {
    console.log(bouteillesCellier);
    return (
        <Grid container spacing={4}>
            {bouteillesCellier.map((bouteille) => (
                <Grid key={bouteille.id} item xs={12}>
                    <CarteBouteille
                        bouteille={bouteille}
                        gereQuantite={gereQuantite}
                    />
                </Grid>
            ))}
        </Grid>
    );
}

export default Cellier;
