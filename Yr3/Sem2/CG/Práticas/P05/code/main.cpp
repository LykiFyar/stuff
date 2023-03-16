#include <stdio.h>
#include <stdlib.h>

#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#define _USE_MATH_DEFINES
#include <math.h>

float alfa = 0.0f, beta = 0.5f, radius = 100.0f;
float camX, camY, camZ;

// radius of open area
float r = 50;
// radius of circular trajectory of red teapots
float ri = 35;
// radius of circular trajectory of blue teapots
float rc = 15;

// Number of red teapots
int nRedT = 20;
// Number of blue teapots
int nBlueT = 8;

// Angle of teapots
float angleR = 0;
float angleB = 0;



void spherical2Cartesian() {

	camX = radius * cos(beta) * sin(alfa);
	camY = radius * sin(beta);
	camZ = radius * cos(beta) * cos(alfa);
}


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
	gluLookAt(camX, camY, camZ,
		0.0, 0.0, 0.0,
		0.0f, 1.0f, 0.0f);

	glColor3f(0.2f, 0.8f, 0.2f);
	glBegin(GL_TRIANGLES);
		glVertex3f(100.0f, 0, -100.0f);
		glVertex3f(-100.0f, 0, -100.0f);
		glVertex3f(-100.0f, 0, 100.0f);

		glVertex3f(100.0f, 0, -100.0f);
		glVertex3f(-100.0f, 0, 100.0f);
		glVertex3f(100.0f, 0, 100.0f);
	glEnd();
	
	// put code to draw scene in here

	// ------------ Trees ------------
	srand(9999);
	for (int i = 0; i < 1000; i++) {

		glPushMatrix();
		float randx = float(rand()) / RAND_MAX * 100 * pow(-1, rand());
		float randz = float(rand()) / RAND_MAX * 100 * pow(-1, rand());

		if((pow(randx,2) + pow(randz,2)) > pow(r,2)){	
			// draw trees
			glTranslatef(randx, 0, randz);
			glRotatef(-90, 1.0f, 0.0f, 0.0f);
			// tronco
			glColor3f(0.8f, 0.6f, 0.0f);
			glutSolidCone(0.2, 3, 8, 8);
			// folhas
			glTranslatef(0.0f, 0.0f, 1.0f);
			glColor3f(0.1f, 1.0f, 0.1f);
			glutSolidCone(0.8, 4, 10, 10);
		}
		glPopMatrix();
	}
	// ------------ Torus ------------
	glPushMatrix();
	
	glTranslatef(0.0f, 1.0f, 0.0f);
	glColor3f(1.0f,0.1f,1.0f);
	glutSolidTorus(0.5f, 2.0f, 15.0f, 15.0f);
	
	glPopMatrix();
	
	// ------------ Red Teapots ------------
	
	glColor3f(1.0f, 0.0f, 0.0f);
	for (int i = 0; i < nRedT; i++) {
		glPushMatrix();

		float varangle = 360 / nRedT * i;
		glRotatef(varangle + angleR, 0, 1, 0);
		glTranslatef(0.0f, 2.0f, ri);
		
		glutSolidTeapot(2);

		glPopMatrix();
	}

	// ------------ Blue Teapots ------------

	glColor3f(0.0f, 0.0f, 1.0f);
	for (int i = 0; i < nBlueT; i++) {
		glPushMatrix();

		float varangle = 360 / nBlueT * i;
		glRotatef(varangle + angleB - 90, 0, 1, 0);
		glTranslatef(rc, 2.0f, 0.0f);

		glutSolidTeapot(2);

		glPopMatrix();
	}

	angleR += 0.2;
	angleB -= 0.2;

	glutSwapBuffers();
}


void processKeys(unsigned char c, int xx, int yy) {

// put code to process regular keys in here

}


void processSpecialKeys(int key, int xx, int yy) {

	switch (key) {

	case GLUT_KEY_RIGHT:
		alfa -= 0.1; break;

	case GLUT_KEY_LEFT:
		alfa += 0.1; break;

	case GLUT_KEY_UP:
		beta += 0.1f;
		if (beta > 1.5f)
			beta = 1.5f;
		break;

	case GLUT_KEY_DOWN:
		beta -= 0.1f;
		if (beta < -1.5f)
			beta = -1.5f;
		break;

	case GLUT_KEY_PAGE_DOWN: radius -= 1.0f;
		if (radius < 1.0f)
			radius = 1.0f;
		break;

	case GLUT_KEY_PAGE_UP: radius += 1.0f; break;
	}
	spherical2Cartesian();
	glutPostRedisplay();

}


void printInfo() {

	printf("Vendor: %s\n", glGetString(GL_VENDOR));
	printf("Renderer: %s\n", glGetString(GL_RENDERER));
	printf("Version: %s\n", glGetString(GL_VERSION));

	printf("\nUse Arrows to move the camera up/down and left/right\n");
	printf("Home and End control the distance from the camera to the origin");
}


int main(int argc, char **argv) {

// init GLUT and the window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH|GLUT_DOUBLE|GLUT_RGBA);
	glutInitWindowPosition(100,100);
	glutInitWindowSize(800,800);
	glutCreateWindow("CG@DI-UM");
		
// Required callback registry 
	glutDisplayFunc(renderScene);
	glutReshapeFunc(changeSize);
	glutIdleFunc(renderScene);

// Callback registration for keyboard processing
	glutKeyboardFunc(processKeys);
	glutSpecialFunc(processSpecialKeys);
	

//  OpenGL settings
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);

	spherical2Cartesian();

	printInfo();

// enter GLUT's main cycle
	glutMainLoop();
	
	return 1;
}
