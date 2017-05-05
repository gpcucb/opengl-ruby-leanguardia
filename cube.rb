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
	glTranslatef(0.0,0.0,-4.0)

	#bASE
	glPushMatrix()
		glTranslate(0,0,0)
		glColor3f(0.9,0.3,0.0)
		glutWireCube(1)
	glPopMatrix()

	#ESCALADO
	glPushMatrix()
		glTranslate(0,0,0)
		glColor3f(0,0.7,0.8)
		glScale(1.5,1.5,1.5)
		glutWireCube(1)
	glPopMatrix()

	# ROTATE
	glPushMatrix()
		glTranslate(0.0,0.0,0.0)
		glColor3f(0,0.3,0.9)
		glRotatef(45,45,45,0)
		glutWireCube(1)
	glPopMatrix()

	#tRANSLATE
	glPushMatrix()
		glTranslate(-2.0,0.9,-1)
		glColor3f(0,0.9,0.3)
		glutWireCube(1)
	glPopMatrix()

	# Combinado
	glPushMatrix()
		glTranslate(2,-1,0.0)
		glColor3f(0.3,0.3,0.3)
		glScale(2.3,2.3,2.3)
		glRotatef(45,0,0,1)
		glutWireCube(1)
	glPopMatrix()

	glFlush
	# glutPostRedisplay
end

glutInit
glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA | GLUT_DEPTH)
glutInitWindowSize(500, 500)
glutInitWindowPosition(20, 20)
glutCreateWindow("Hola OpenGL, en Ruby")
glutDisplayFunc :disp
glutMainLoop
