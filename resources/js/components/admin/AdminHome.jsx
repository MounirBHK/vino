import React from "react";
import { useEffect } from "react";
import "./AdminHome.scss";
import { Admin, Resource } from "react-admin";
import { useNavigate } from "react-router-dom";
import Dashboard from "./Dashboard";
import Bouteilles from "./bouteilles/Bouteilles";
import Users from "./Users";
import authProvider from "./authProvider";
import simpleRestProvider from "ra-data-simple-rest";

function AdminHome({ setBouteilles, bouteilles }) {
    const navigate = useNavigate();
    const dataProvider = simpleRestProvider(window.location.origin + "/api");

    useEffect(() => {
        const adminUser = localStorage.getItem("adminUser") || null;
        if (window.location.pathname !== "/admin/login" && !adminUser)
            navigate("/admin/login", {});
    }, []);

    return (
        <Admin
            dashboard={Dashboard}
            dataProvider={dataProvider}
            authProvider={authProvider}
            basename="/admin"
        >
            <Resource
                name="bouteilles"
                list={Bouteilles}
                options={{
                    setBouteilles: setBouteilles,
                    bouteilles: bouteilles,
                }}
            />
            <Resource name="users" list={Users} />
        </Admin>
    );
}

export default AdminHome;
