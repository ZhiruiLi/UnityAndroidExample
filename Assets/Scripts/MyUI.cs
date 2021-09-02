using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MyUI : MonoBehaviour
{
    public Button button;
    public Text text;

    private void Start()
    {
        button.onClick.AddListener(OnClickButton);
    }

    private static void OnClickButton()
    {
#if UNITY_ANDROID && !UNITY_EDITOR
        using (AndroidJavaClass jc = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
        {
            using (AndroidJavaObject activity = jc.GetStatic<AndroidJavaObject>("currentActivity"))
            {
                activity.Call("showMessage", "Hello from Unity");
            }
        }
#else
#endif
    }

    private void ChangeText(string data)
    {
        text.text = data;
    }
}