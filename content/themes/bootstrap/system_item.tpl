
<div onclick="location.href='[@url]';" class="system_item">

	<h2>[@system]
	</h2>
	<ul>
		<li><strong>USA:</strong> [@usa]</li>
		<li><strong>Japan:</strong> [@japanese]</li>
		<li><strong>Europe:</strong> [@europeon]</li>
		<li><strong>Asia:</strong> [@asia]</li>
		<li><strong>Australia:</strong> [@australia]</li>
	</ul>

	<div class="progress_bar_title">Total: [@total]</div>
	<div class="progress_bar">
		<div role="progressbar" style="width: [@percentage]%;" aria-valuenow="3" aria-valuemin="0" aria-valuemax="128"></div>
	</div>
<div style="
    margin-left: calc(285px - (100% - [@percentage]%));
    font-size: 10px;
">[@percentage]%</div>
<div style="
    margin-top: -5px;
    margin-left: 118px;
    font-size: 14px;
">Finished</div>
</div>

