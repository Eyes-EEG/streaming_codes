using UnityEngine;
using System.Collections;
using System.Net;
using System.Net.Sockets;
using System.Linq;
using System;
using System.IO;
using System.Text;

public class Manager : MonoBehaviour
{
    public Boton[] botones;
    public int Posicion = 0;

    // Start is called before the first frame update
    TcpListener listener;
    String msg;
    void Start()
    {
        listener = new TcpListener(IPAddress.Parse("127.0.0.1"), 55001);
        listener.Start();
        print("is listening");
    }

    // Update is called once per frame
    void Update()
    {
        if (!listener.Pending())
        {
        }
        else
        {
            
            TcpClient client = listener.AcceptTcpClient();
            NetworkStream ns = client.GetStream();
            StreamReader reader = new StreamReader(ns);
            msg = reader.ReadToEnd();
            
        }

        if (msg == "2")
        {
            botones[Posicion].Seleccionado = false;
            Posicion++;

            if (Posicion < 0)
            {
                Posicion = botones.Length - 1;
                botones[Posicion].Seleccionado = true;
                msg = "1";
                return;
            }
            if (Posicion > botones.Length - 1)
            {
                Posicion = 0;
                botones[Posicion].Seleccionado = true;
                msg = "1";
                return;
            }

            botones[Posicion].Seleccionado = true;
            msg = "1";

        }

        if (msg == "3")
        {
            botones[Posicion].Seleccionado = false;
            Posicion--;

            if (Posicion < 0)
            {
                Posicion = botones.Length - 1;
                botones[Posicion].Seleccionado = true;
                msg = "1";
                return;
            }
            if (Posicion > botones.Length - 1)
            {
                Posicion = 0;
                botones[Posicion].Seleccionado = true;
                msg = "1";
                return;
            }

            botones[Posicion].Seleccionado = true;
            msg = "1";
        }

        if (botones[0].Seleccionado && msg == "4")
        {
            print("Arriba");
            msg = "1";
        }

        if (botones[1].Seleccionado && msg == "4")
        {
            print("Izquierda");
            msg = "1";
        }

        if (botones[2].Seleccionado && msg == "4")
        {
            print("Abajo");
            msg = "1";
        }

        if (botones[3].Seleccionado && msg == "4")
        {
            print("Derecha");
            msg = "01";
        }
    }


}

