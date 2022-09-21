import React from 'react';
import axios from 'axios';
import { useNavigate } from "react-router-dom";
import { useState, useRef, useEffect, useContext } from "react";
import CelliersContext from "../../context/celliersContext";

export default function SupprimerCellier({idCellierEnCours, bouteillesCellier, setBouteillesCellier, setCelliers}) {
 
    const celliers = useContext(CelliersContext);
    const navigate = useNavigate();
    const userLoggedIn = JSON.parse(localStorage.getItem("user")) || null;
    const hostOriginURL = window.location.origin;

    const deleteCell = async(idCellierEnCours) => {
        // console.log("appel de la fonction ");
        return await axios.delete(
            hostOriginURL + `/api/deleteCellier/${idCellierEnCours}`,
            // {
            //     headers: {
            //         Authorization: "Bearer " + userLoggedIn.access_token,
            //     },
            // }
        );
    };

    const handleSuppCellier = (idCellierEnCours) => {
        // console.log("idCellierEnCours : ",idCellierEnCours);
        deleteCell(idCellierEnCours).then((response)=>{
            const newCelliers = response.data;
            console.log("newCelliers : ", newCelliers);

            const user_id = userLoggedIn.user.id;
            let res = newCelliers.filter((cellier) => cellier.id_user === user_id);
            // console.log("res : ", res);
            setCelliers([...res]);
            navigate(`/dashboard/celliers`);
        });
    }

  return (
    <>
        <div>SupprimerCellier</div>
        <button
            onClick={() => {
                handleSuppCellier(idCellierEnCours);
            }}
        >
        Suppression
        </button>

        <br></br><br></br>
        
        <button
            onClick={() => {
                history.back();
            }}
        >
        Annuler
        </button>
    </>
  )
}
