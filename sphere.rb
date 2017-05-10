require 'opengl'
require 'glu'
require 'glut'

include Gl
include Glu
include Glut

def disp
	glDepthFunc(GL_LEQUAL)
	glEnable(GL_DEPTH_TEST)

	glClearColor(0,0,0,0) 		# background Color
	glClearDepth(1.0)
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT) # borramos la pantalla

	glMatrixMode(GL_PROJECTION) # Modo proyección
	#glOrtho(-1.0, 1.0, -1.0, 1.0, -1.0, 1.0)
	glLoadIdentity
	gluPerspective(60.0,1.0,1.0,100.0)

	glMatrixMode(GL_MODELVIEW)
	glTranslatef(0.0,0.0,-5.0)

	glEnable(GL_LIGHTING)
	glEnable(GL_LIGHT0)
	glEnable(GL_COLOR_MATERIAL)
	glColorMaterial(GL_FRONT_AND_BACK, GL_AMBIENT_AND_DIFFUSE)
	glEnable(GL_NORMALIZE)
	glShadeModel(GL_SMOOTH)

	position=[50, 30, 100]
	ambient=[1, 1, 1, 1]
	color=[0.2, 0.2, 0.1, 1.0]

	glLightfv(GL_LIGHT0, GL_POSITION, position)
	glLightfv(GL_LIGHT0, GL_DIFFUSE, color)
	glLightfv(GL_LIGHT0, GL_SPECULAR, color)
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambient)

	glPushMatrix()
		glTranslate(0,1,0)
		glColor3f(0.9,0.3,0.0)
		glutSolidSphere(1.3,20,9)
	glPopMatrix()

	glPushMatrix()
		glTranslate(3,1,0)
		glColor3f(0.2,0.3,0.4)
		glutSolidSphere(1.3,20,9)
	glPopMatrix()

	glPushMatrix()
		glTranslate(0,-1,0)
		glColor3f(0.7,0.8,0.4)
		glutSolidSphere(1.3,20,9)
	glPopMatrix()

	glPushMatrix()
		glTranslate(3,-1,0)
		glColor3f(0.8,0.2,0.4)
		glutSolidSphere(1.3,20,9)
	glPopMatrix()

	glFlush
end

glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH)
glutInitWindowSize(500, 500)
glutInitWindowPosition(20, 20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :disp
glutMainLoop
