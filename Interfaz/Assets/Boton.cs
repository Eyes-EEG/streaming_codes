using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Boton : MonoBehaviour
{

    
    public Image BotonImage;
    public bool Seleccionado = false;
   
     
    // Start is called before the first frame update
    void Start()
    {
        BotonImage = GetComponent<Image>();
        
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Seleccionado)
        {
            GetComponent<Image>().color = Color.blue;
        }

        else
        {

            GetComponent<Image>().color = Color.white;
        }

    }
}
