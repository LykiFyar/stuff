#ifdef __APPLE__
#include <GLUT/glut.h>
#else
#include <GL/glut.h>
#endif

#include <string.h>

#define _USE_MATH_DEFINES
#include <math.h>

float alpha = 0;
float beta = 0;
float r = 5;

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


void drawCylinder(float radius, float height, int slices) {

// put code to draw cylinder in here

	glBegin(GL_TRIANGLES);
	for (float i = 0; i < slices; i++) {

		float px = radius * sin(i * 2 * M_PI / slices);
		float px1 = radius * sin((i + 1) * 2 *M_PI / slices);
		float pz = radius * cos(i * 2 * M_PI / slices);
		float pz1 = radius * cos((i + 1) * 2 * M_PI / slices);
		float h = height / 2;

		
		glVertex3f(0, h, 0);
		glVertex3f(px, h, pz);
		glVertex3f(px1, h, pz1);

		glVertex3f(px1, h, pz1);
		glVertex3f(px, h, pz);
		glVertex3f(px, -h, pz);

		glVertex3f(px1, h, pz1);
		glVertex3f(px, - h, pz);
		glVertex3f(px1, - h, pz1);
		

		glVertex3f(0, - h, 0);
		glVertex3f(px1, - h, pz1);
		glVertex3f(px, -h, pz);
	}
	glEnd();
}


void renderScene(void) {

	// clear buffers
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	// set the camera
	glLoadIdentity();
	gluLookAt(r * cos(beta) * sin(alpha),r * sin(beta),r * cos(beta) * cos(alpha), 
		      0.0,0.0,0.0,
			  0.0f,1.0f,0.0f);

	drawCylinder(1,2,30);

	
	
	// End of frame
	glutSwapBuffers();
}


void processKeys(unsigned char c, int xx, int yy) {

// put code to process regular keys in here
	switch (c)
	{
	case '+':
		r -= 0.2;
		break;
	case '-':
		r += 0.2;
		break;
	default:
		break;
	}

	glutPostRedisplay();
}


void processSpecialKeys(int key, int xx, int yy) {

// put code to process special keys in here
	switch (key) {
	case GLUT_KEY_UP:
		beta += 0.1;
		break;
	case GLUT_KEY_DOWN:
		beta -= 0.1;
		break;
	case GLUT_KEY_LEFT:
		alpha -= 0.15;
		break;
	case GLUT_KEY_RIGHT:
		alpha += 0.15;
		break;
	default:
		break;
	}

	if (beta > 1.5) beta = 1.5;
	if (beta < -1.5) beta = -1.5;

	glutPostRedisplay();
}


int main(int argc, char **argv) {

// init GLUT and the window
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DEPTH|GLUT_DOUBLE|GLUT_RGBA);
	glutInitWindowPosition(100,100);
	glutInitWindowSize(800,800);
	glutCreateWindow("Helicopter, Helicopter!");
		
// Required callback registry 
	glutDisplayFunc(renderScene);
	glutReshapeFunc(changeSize);
	
// Callback registration for keyboard processing
	glutKeyboardFunc(processKeys);
	glutSpecialFunc(processSpecialKeys);

//  OpenGL settings
	glEnable(GL_DEPTH_TEST);
	glEnable(GL_CULL_FACE);
	glPolygonMode(GL_FRONT, GL_LINE);
	
// enter GLUT's main cycle
	glutMainLoop();
	
	return 1;
}
