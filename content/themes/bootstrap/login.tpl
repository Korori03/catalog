<div class="flex-grid">
    <div style="margin-left: auto;margin-right:auto;">
        <table style="width:260px;text-align:center;margin-left:auto;margin-right:auto;">
           <tbody>
              <tr>
                 <td colspan="3" data-children-count="1"><input style="width:100%;margin-bottom:5px;" value="Username" id="usernameM" maxlength="30" ></td>
              </tr>
              <tr>
                 <td colspan="3" data-children-count="1"><input style="margin-bottom:5px;width:100%;" type="password" id="passwordM" maxlength="30"></td>
              </tr>
			  
			   <tr>
			    <td colspan="1" data-children-count="1">
					Remember Me?
				</td>
                 <td colspan="1" data-children-count="1">
						
						<label class="switch" data-children-count="1">
							<input type="checkbox" id="remember" aria-label="Remember Me" checked="checked">
							<span class="slider"></span>
						</label></td>
              </tr>
			  
			  
			  
              <tr>
                 <td style="width:250px;" colspan="3"><input class="default" type="button" value="login" id="btnLoginM" style="width:260px;"></td>
              </tr>
              <tr>
                 <td colspan="3" style="text-align:center;">
                    <div id="loginerror"></div>
                 </td>
              </tr>
           </tbody>
        </table>
     </div>
</div>
<style>
.progress_bar_title{
	font-weight:400;
	color:#86939e;
	line-height:1.5;
	margin:0;
	font-size:1rem;
}
input[type=button], input[type=submit] {
    font-family: "Times New Roman", Times, serif;
    background-color: #428bca;
    color: #fff;
    padding: 5px 12px;
    -moz-border-radius-bottomright: 5px;
    border-bottom-right-radius: 5px;
    -moz-border-radius-bottomleft: 5px;
    border-bottom-left-radius: 5px;
    -moz-border-radius-topright: 5px;
    border-top-right-radius: 5px;
    -moz-border-radius-topleft: 5px;
    border-top-left-radius: 5px;
    cursor: pointer;
    height: 45px;
    display: inline;
}

button:hover, input[type=button]:hover, input[type=submit]:hover {
    background-color: #369;
    cursor: pointer;
}
input {
    box-sizing: border-box;
    display: block;
    width: 100%;
    font-family: inherit;
    font-size: 16px;
    height: 40px;
    outline: 0;
    vertical-align: middle;
    background-color: #fff;
    border: 1px solid #cacfd4;
    border-radius: .1875em;
    box-shadow: none;
    padding: 0 .5em;
}
.progress_bar{
	height: .25rem;
	border-radius: 0!important;
	overflow: hidden;
	font-size: .75rem;
	background-color: #e9ecef;
	display: flex;
}
.progress_bar div {
	
	display: flex;
	flex-direction: column;
	justify-content: center;
	color: #fff;
	text-align: center;
	white-space: nowrap;
	background-color: #03a9f4;
	
}

.flex-grid {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  justify-content: center;
}

.flex-grid > div {
  flex: 2;
  margin: 15px;
  padding: 15px;
  background: #fbfbfb;
  border: 1px solid #bbb;
  box-shadow: 0 0 20px -3px #bbb;
  width: 330px;
  min-width: 330px;
  max-width: 330px;
  font-size: 14px;
  cursor:pointer;
}

.flex-grid h2 {
  margin: -15px -15px 15px -15px;
  padding: 12px 15px;
  font-size: 16px;
  font-weight: 400;
  border-bottom: 1px solid #ddd;
}

.flex-grid li {
  padding: 0 0 0 5px;
  display: table-cell;
}

.flex-grid div ul{
  margin-bottom: 15px;
  display: table;
  width: 100%;
  margin-left: -5px;
  text-align: center;
}


</style>
