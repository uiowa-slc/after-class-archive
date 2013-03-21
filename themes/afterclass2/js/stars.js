		var canvasController = null;
		var bounds = null;
		var colorPool = new ColorPool( "#837883" );
		var objectPool = new ObjectPool( StarOrb, 1);
		var orbs = new Array();
		var behaviours = new BehaviourManager();
		var triggers = new TriggerManager();

		function starInit()
		{
			objectPool.onCreateObject = onCreateObject;

			canvasController = new CanvasController( document.getElementById( "canvas" ) );

			bounds = new Bounds( 0, 0, canvasController.canvas.width, canvasController.canvas.height );

			var rectangle = new Rectangle();
			rectangle.width = 1000;
			rectangle.height = 240;
			rectangle.alpha = 0.0;
			canvasController.addChild( rectangle );

			canvasController.capture = false;
			canvasController.update();
			
			Ticker.add( update );
			Ticker.start();
		}
		
		function randomFromInterval(from,to)
		{	
			return Math.floor(Math.random()*(to-from+1)+from);
		}

		function onCreateObject( orb )
		{
			orb.x = randomFromInterval(0,800);
			orb.y = 0;

			orb.color = colorPool.getColor();

			// target, drag, minScale, maxScale, minForce, maxForce, emitMinAngle, emitMaxAngle, gravityForce, gravityAngle

			behaviours.add( new Emitter( orb, 1, 0.4, 4, 10, 15, -45, 45, 0.5, 90 ) );

			triggers.add( new ExitBoundsTrigger( orb, bounds, onExitBounds ) );

			orbs.push( orb );
			canvasController.addChild(orb);
			
		}

		function onExitBounds( orb )
		{
			canvasController.removeChild( orb );
			
			
			window.setTimeout(function(){objectPool.release(orb)}, 1000);
			
			
			behaviours.removeAllForTarget( orb );
			triggers.removeAllForTarget( orb );
		}

		function update()
		{
			objectPool.request();
			behaviours.update();
			triggers.update();
			canvasController.update();

			//document.getElementById( "objectCount" ).innerHTML = "Object count: " + objectPool.pool.length;
		}

		function toggleCapture()
		{
			canvasController.capture = !canvasController.capture;
			
		}
