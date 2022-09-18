
import "./CarteBouteille.scss";
import * as React from 'react';
import Card from "@mui/material/Card";



export default function Bouteille({id_bouteille, image, nom_bouteille, code_saq, description}) {
    const url = image;
    const urlNoParam = url.split("?")[0];

    return (
        <>
            <Card className="Carte-bouteille">
                <div className="wrapper">
                    <div className="info">
                        <h3>{nom_bouteille}</h3>
                        <p>{code_saq}</p>
                        <p>{description}</p>
                    </div>
                    <img
                        className="img-rotate"
                        srcSet={urlNoParam}
                        alt="bouteille"
                    />
                </div>
            </Card>
        </>
    );
}
