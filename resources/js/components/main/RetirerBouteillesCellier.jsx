import React, { useState, useEffect } from 'react';
import { useParams, useNavigate, useLocation } from "react-router-dom";
import axios from "axios";
import { Button } from 'react-admin';
import CarteBouteille from "./CarteBouteille";
import {Grid,TextField,Select,MenuItem,FormControl,ListItem,Box,List,Divider} from "@mui/material";
import Bouteille from './Bouteille';

export default function RetirerBouteillesCellier({idCellierEnCours, bouteillesCellier}) {
  
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const hostOriginURL = window.location.origin;
    const [boutsCellRef, setBoutsCellRef] = useState([...bouteillesCellier]);
    const [idRef, setIdRef] = useState(idCellierEnCours);

    useEffect(()=>{
        if(! idCellierEnCours){
            const urlCourante = document.location.href; 
            const idCellURL= parseInt(urlCourante.slice(urlCourante.lastIndexOf("/")+1));
            setIdRef(idCellURL);
            getBouteillesCellier(idCellURL).then((response)=>{
                setBoutsCellRef([...response.data])
            });
        } 
    },[]);

    const getBouteillesCellier = async(idCellierEnCours) => {
        return await axios.get(
            hostOriginURL + "/api/cellier/"+idCellierEnCours,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };

    const deleteBoutCell = async(idRef, idBtSupp) => {
        // console.log("appel de la fonction delete bouteille...");
        // console.log("idRef : ",idRef);
        // console.log(idBtSupp);
        const cellBout = {id_cellier: idRef, id_bouteille: idBtSupp}

        return await axios.delete(
            hostOriginURL + `/api/deleteBoutCellier/${idRef}/${idBtSupp}`,
            cellBout,
            {
                headers: {
                    Authorization: "Bearer " + userLoggedIn.access_token,
                },
            }
        );
    };
   
    const handleSuppBoutCell = (boutsCellRef, idRef, idBtSupp) =>{
        deleteBoutCell(idRef,idBtSupp).then((response)=>{

            // console.log(response);

            let res = boutsCellRef.filter((bout) => bout.id_bouteille !== idBtSupp);
            setBoutsCellRef(res);
            console.log(boutsCellRef);

        });
    };

    return (
    <div>
        <h2>Retirer Bouteilles du Cellier</h2>

        <label htmlFor="liste">
            <Box className="bouteilles">
                <Box>
                    <Divider>Liste des Bouteilles</Divider>
                    <List className="recherche">
                        {boutsCellRef.map((bouteille) => (                            
                            <ListItem
                                divider
                                key={bouteille.id_bouteille}
                                onClick={(e) =>
                                    handleSuppBoutCell(boutsCellRef, idRef, bouteille.id_bouteille)
                                }
                            >
                                <Bouteille
                                    idCellierEnCours={idRef}
                                    {...bouteille}
                                />
                            </ListItem>
                        ))}
                    </List>
                </Box>
            </Box>
        </label>

    </div>




  )
}
