import axios from "axios";
import React, { useState, useEffect } from "react";
import { CelliersProvider } from "../context/celliersContext";
import { BouteillesProvider } from "../context/bouteillesContext";
import Entete from "./entete/Entete";
import Main from "./main/Main";

function App() {
    const [bouteilles, setBouteilles] = useState([]);
    const [celliers, setCelliers] = useState([]);
    const [user, setUser] = useState(1);
    const hostOriginURL = window.location.origin;

    const getCelliers = async (userId) => {
        return await axios.get(hostOriginURL + "/api/celliers/user/" + userId);
    };

    const getBouteilles = async (idCellier) => {
        return await axios.get(hostOriginURL + "/api/cellier/" + idCellier);
    };

    // const getBouteilles = async () => {
    //     return await axios.get(hostOriginURL + "/api/bouteilles");
    // };

    useEffect(() => {
        const userId = user;
        getCelliers(userId).then((celliersData) => {
            console.log(celliersData);
            setCelliers(celliersData.data);
        });
        // getBouteilles().then((bouteillesData) => {
        //     setBouteilles(bouteillesData.data);
        //     console.log(bouteillesData);
        // });
    }, []);

    function gereSelectCellier(idCellier) {
        getBouteilles(idCellier).then((bouteillesData) => {
            console.log(bouteillesData);
            setBouteilles(bouteillesData.data);
        });
    }

    return (
        <React.Fragment>
            <CelliersProvider value={celliers}>
                <BouteillesProvider value={bouteilles}>
                    <Entete onSelectCellier={gereSelectCellier} />
                    <Main />
                </BouteillesProvider>
            </CelliersProvider>
        </React.Fragment>
    );
}

export default App;
