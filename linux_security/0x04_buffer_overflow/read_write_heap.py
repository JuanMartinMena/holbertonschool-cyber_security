#!/usr/bin/python3
"""
read_write_heap - Busca y reemplaza una cadena en la heap de un proceso en ejecución.
"""

import sys
import os

def read_write_heap(pid, search, replace):
    """Busca search en el heap del proceso y lo reemplaza con replace."""
    try:
        if len(search) != len(replace):
            print("Error: search_string y replace_string deben tener la misma longitud")
            return

        maps_path = "/proc/{}/maps".format(pid)
        mem_path = "/proc/{}/mem".format(pid)

        with open(maps_path, 'r') as maps_file:
            for line in maps_file:
                if '[heap]' in line:
                    heap_range = line.split(' ')[0]
                    start, end = [int(x, 16) for x in heap_range.split('-')]
                    break
            else:
                print("No se encontró la sección heap.")
                return

        with open(mem_path, 'rb+') as mem_file:
            mem_file.seek(start)
            heap = mem_file.read(end - start)
            idx = heap.find(bytes(search, "ascii"))
            if idx == -1:
                print("Cadena no encontrada en la heap.")
                return
            mem_file.seek(start + idx)
            mem_file.write(bytes(replace, "ascii"))
            print("Reemplazo exitoso.")

    except Exception as e:
        print("Error:", e)
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Uso: {} pid search_string replace_string".format(sys.argv[0]))
        sys.exit(1)

    pid = sys.argv[1]
    search_string = sys.argv[2]
    replace_string = sys.argv[3]
    read_write_heap(pid, search_string, replace_string)