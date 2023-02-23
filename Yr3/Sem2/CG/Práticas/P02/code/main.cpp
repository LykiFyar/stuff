#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <iostream>
#include <GL/glut.h>
#endif

#include <math.h>


static float transx = 0;
static float transy = 0;
static float transz = 0;
float angle = 0;
float scalex = 1;
float scaley = 1;
float scalez = 1;

void changeSize(int w, int h) {

	// Prevent a divide by zero, when window is too short
	// (you cant make a window with zero width).
	if(h == 0)
		h = 1;

	// compute window's aspect ratio 
	float ratio = w * 1.0 / h;

	// Set the projection matrix as current
	glMatrixMode(GL_PROJECTION);
	// Load Identity Matrix
	glLoadIdentity();
	
	// Set the viewport to be the entire window
    glViewport(0, 0, w, h);

	// Set perspective
	gluPerspective(45.0f ,ratio, 1.0f ,1000.0f);

	// return to the model view matrix mode
	glMatrixMode(GL_MODELVIEW);
}


void renderScene(void) {

	// clear buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	// set the camera
	glLoadIdentity();
	gluLookAt(5.0,5.0,5.0, 
		      0.0,0.0,0.0,
			  0.0f,1.0f,0.0f);

// put axis drawing in here
	glBegin(GL_LINES);

	glColor3f(1, 0, 0);
	glVertex3f(-100, 0, 0);
	glVertex3f(100, 0, 0);

	glColor3f(0, 1, 0);
	glVertex3f(0, -100, 0);
	glVertex3f(0, 100, 0);

	glColor3f(0, 0, 1);
	glVertex3f(0, 0, -100);
	glVertex3f(0, 0, 100);

	glEnd();


// put the geometric transformations here

	glTranslatef(transx, transy, transz);
	glRotatef(angle, 0,1,0);
	glScalef(scalex, scaley, scalez);

// put pyramid drawing instructions here
	glBegin(GL_TRIANGLES);

	glColor3f(0.8, 0.4, 0);
	glVertex3f(-1, 0, 1);
	glVertex3f(1, 0, -1);
	glVertex3f(1, 0, 1);

	glColor3f(0.8, 0.4, 0);
	glVertex3f(-1, 0, 1);
	glVertex3f(-1, 0, -1);
	glVertex3f(1, 0, -1);

	glColor3f(0.2,0.8,0);
	glVertex3f(1, 0, -1);
	glVertex3f(0,1,0);
	glVertex3f(1, 0, 1);

	glColor3f(0.4, 0 , 0.4);
	glVertex3f(-1, 0, -1);
	glVertex3f(0, 1, 0);
	glVertex3f(1, 0, -1);

	glColor3f(0, 0, 1);
	glVertex3f(-1, 0, -1);
	glVertex3f(-1, 0, 1);
	glVertex3f(0,1,0);

	glColor3f(0, 1, 0);
	glVertex3f(1, 0, 1);
	glVertex3f(0, 1, 0);
	glVertex3f(-1, 0, 1);

	glEnd();

	// End of frame
	glutSwapBuffers();
}



// write function to process keyboard events
void keyboardProcess(unsigned char key, int x, int y) {
	switch (key)
	{
	case 'w':
		transz = transz - 0.2;
		break;
	case 'a':
		transx = transx - 0.2;
		break;
	case 's':
		transz = transz + 0.2;
		break;
	case 'd':
		transx = transx + 0.2;
		break;
	case'+':
		scalex = scalex + 0.2;
		scaley = scaley + 0.2;
		scalez = scalez + 0.2;
		break;
	case '-':
		scalex = scalex - 0.2;
		scaley = scaley - 0.2;
		scalez = scalez - 0.2;
		break;
	default:
		break;
	}

	glutPostRedisplay();
}

void specialProcess(int key_code, int x, int y) {
	switch (key_code)
	{
	case GLUT_KEY_LEFT: // left arrow
		angle -= 1.0;
		break;
	case GLUT_KEY_UP: // up arrow
		scalex = scalex + 0.2;
		scaley = scaley + 0.2;
		scalez = scalez + 0.2;
		break;
	case GLUT_KEY_RIGHT: // right arrow
		angle += 1;
		break;
	case GLUT_KEY_DOWN: // down arrow
		scalex = scalex - 0.2;
		scaley = scaley - 0.2;
		scalez = scalez - 0.2;
		break;
	default:
		break;
	}

	glutPostRedisplay();
}

void mouseProcess(int key_code, int x, int y) {

	switch (key_code)
	{
	default:
		break;
	}

	glutPostRedisplay();
}





int main(int argc, char **argv) {

// init GLUT and the window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH|GLUT_DOUBLE|GLUT_RGBA);
	glutInitWindowPosition(100,100);
	glutInitWindowSize(800,800);
	glutCreateWindow("Howdy Partner!");
		
// Required callback registry 
	glutDisplayFunc(renderScene);
	glutReshapeFunc(changeSize);

	
// put here the registration of the keyboard callbacks
	glutKeyboardFunc(keyboardProcess);
	glutSpecialFunc(specialProcess);


//  OpenGL settings
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);
	glCullFace(GL_BACK); // GL_FRONT expõe os triângulos de costas para a camara, GL_BACK é default
	
// enter GLUT's main cycle
	glutMainLoop();
	
	return 1;
}
