<?php

namespace App\Http\Controllers;

use App\Models\Ciudad;
use App\Models\Producto;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Response;

class ProductosController extends Controller
{
    public function user(Request $request)
    {
        return response()->json($request->user());
    }

    public function productos(Request $request)
    {

        $productos = Producto::all();	
        

        return response()->json($productos);
    }
    public function ciudades(Request $request)
    {
        
        $ciudades = Ciudad::all();	
      
        return response()->json($ciudades);
    }

    public function crear(Request $request)
    {
        

   
        $producto = new Producto();
        $producto->name = $request->name;
        $producto->precio = $request->precio;
        $producto->cantidad = $request->cantidad;
        $producto->imagen = $request->imagen;
        $producto->observacion = $request->observacion;
        $producto->save();

     
        $producto->Ciudad()->attach($request->ciudad);
        
     
     
        return response()->json($producto);
    }

    public function editar(Request $request)
    {
        $producto = Producto::find($request->id);	
        $producto->name = $request->name;
        $producto->precio = $request->precio;
        $producto->cantidad = $request->cantidad;
        $producto->imagen = $request->imagen;
        $producto->observacion = $request->observacion;
        $producto->save();

        
     //    $producto->Ciudad()->attach($request->ciudad);
       $producto->Ciudad()->sync($request->ciudad);
        
        
     
     
        return response()->json($request);
    }

    public function ver(Request $request)
    {
        $productos = Producto::find($request->id);	
        $ciudades=$productos->ciudad;
     
     
        return response()->json([$productos,$ciudades]);
    }

    public function eliminar(Request $request)
    {
        $productos = Producto::find($request->id);	
        
        $productos->delete();
     
        return response()->json("hecho");
    }




    public function imageup(Request $request)
    {

        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);
        
    
        $imageName = time().'.'.$request->image->extension();  
     
        $request->image->move(public_path('images'), $request->name);
  
        
    
        return back()
            ->with('success','You have successfully upload image.')
            ->with('image',$imageName); 
    }


    public function imagesee($fileName){

        $path = public_path().'/images/'.$fileName;
        return Response::download($path);        

        
    }



}
