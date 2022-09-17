
import "./CarteBouteille.scss";
import * as React from 'react';
import List from '@mui/material/List';
import Card from "@mui/material/Card";
import ListItem from '@mui/material/ListItem';



export default function Bouteille({id_bouteille, image, nom_bouteille, code_saq, description}) {
    const url = image;
    const urlNoParam = url.split("?")[0];

    return (
        <>
            <Card className="Carte-bouteille">
                        <div className="info">
                            <h3>{nom_bouteille}</h3>
                            <p>{code_saq}</p>
                            <p>{description}</p>
                        </div>
                        <div className="bouteille-img">
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
