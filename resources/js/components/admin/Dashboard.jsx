import React from "react";
import Card from "@mui/material/Card";
import CardContent from "@mui/material/CardContent";
import CardHeader from "@mui/material/CardHeader";

function Dashboard() {
    return (
        <Card>
            <CardHeader title="Vino" />
            <CardContent>
                Bienvenue dans l'interface d'administration
            </CardContent>
        </Card>
    );
}

export default Dashboard;
