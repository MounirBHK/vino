import './Bouteille.scss';
import * as React from 'react';
import List from '@mui/material/List';
import Card from "@mui/material/Card";
import ListItem from '@mui/material/ListItem';



export default function Bouteille({id_bouteille, image, nom_bouteille, code_saq, description}) {

    return (
        <>
            <Card className="carte-bouteille">
                <List>
                    <ListItem>
                        <img
                            className="img-rotate bouteille-img"
                            srcset={image}
                            alt="bouteille"
                        />
                        <div>
                            <h3>{nom_bouteille}</h3>
                            <p>{code_saq}</p>
                            <p>{description}</p>
                        </div>
                    </ListItem>
                </List>
            </Card>
        </>
    );
}
