package  
{
	import flash.display.Shader;
	import flash.filters.ShaderFilter;
	
	/**
	 * ...
	 * @author 
	 */
	public class BlurBoxShaderFilter extends ShaderFilter 
	{
		
		public function BlurBoxShaderFilter() 
		{
			super(new BoxBlurShader());
		}
		
	}

}