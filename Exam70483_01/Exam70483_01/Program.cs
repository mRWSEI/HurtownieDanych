﻿using System;
using System.Threading.Tasks;
using System.Threading;
namespace Listing_1._1Parallel_Invoke
{
    class Program
    {
        static void Task1()
        {
            Console.WriteLine("Task 1 starting");
            Thread.Sleep(2000);
            Console.WriteLine("Task 1 ending");
        }
        static void Task2()
        {
            Console.WriteLine("Task 2 starting");
            Thread.Sleep(1000);
            Console.WriteLine("Task 2 ending");
        }
        static void Main(string[] args)
        {
            Parallel.Invoke(() => Task1(), () => Task2(), () => Task1());
            Console.WriteLine("Finished processing. Press a key to end.");
            Console.ReadKey();
        }
    }
}