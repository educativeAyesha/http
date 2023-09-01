package com.educative;


import java.util.Scanner;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
        try {
            //Creating a HttpClient object
            CloseableHttpClient httpclient = HttpClients.createDefault();

            //Creating a HttpGet object
            HttpGet httpget = new HttpGet("https://www.educative.io/path/java-for-programmers");

            //Printing the method used
            System.out.println("Request Type: " + httpget.getMethod());

            //Executing the Get request
            HttpResponse httpresponse = httpclient.execute(httpget);

            Scanner sc = new Scanner(httpresponse.getEntity().getContent());

            //Printing the status line
            System.out.println(httpresponse.getStatusLine());
            while (sc.hasNext()) {
                System.out.println(sc.nextLine());
            }

        } catch (Exception e) {
            System.out.println(e.toString());

        }
    }
}
