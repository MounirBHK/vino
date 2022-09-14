import React from "react";
import "./CarteBouteille.scss";
import { Card } from "@mui/material";
import CircleIcon from '@mui/icons-material/Circle';

function CarteBouteille({ bouteille }) {
    const url = bouteille.url_img;
    const urlNoParam = url.split('?')[0];
    return (
        <React.Fragment>
            <Card className="Carte-bouteille">
                <div className="couleur">
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 100, top: -40, left: 200 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 50, top: 0, left: 325 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 150, top: 10, left: 250 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 25, top: 0, left: 125 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 50, top: 40, left: 150 }} /></p>
                    <p className={bouteille.type}><CircleIcon sx={{ fontSize: 15, top: 75, left: 100 }} /></p>
                </div>
                <div className="info">
                    <h3 className="nom">{bouteille.nom_bouteille}</h3>
                    <p className="pays">{bouteille.description}</p>
                </div>
        </Card>
        <div className="bouteille-img">
            <img className="img-rotate" src={urlNoParam} alt="bouteille" />
        </div>
        </React.Fragment>
    );
}

export default CarteBouteille;
