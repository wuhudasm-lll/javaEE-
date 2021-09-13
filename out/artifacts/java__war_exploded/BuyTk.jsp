<%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.company.Mysql.DButil" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
	<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<title>影院座位选择</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" />
	<link rel="stylesheet" type="text/css" href="css/demo.css" />
	<link rel="stylesheet" type="text/css" href="css/component.css" />
	<script src="js/modernizr-custom.js"></script>
</head>
<body>
<%
	//此进行连接数据库
	String url="jdbc:mysql://localhost:3306/movie?useSSL=false"; //test为数据库名称
	String dbuser="root"; //数据库账户
	String dbpwd=""; //数据库密码
	try
	{
		Class.forName("com.mysql.jdbc.Driver"); //加载驱动 JspStudy
	}
	catch (ClassNotFoundException e)
	{
		e.printStackTrace();
	}
%>
<div class="container">
	<div class="cube">
		<div class="cube__side cube__side--front"></div>
		<div class="cube__side cube__side--back">
			<div class="screen">
				<div class="video">
					<video class="video-player" src="https://blz-videos.nosdn.127.net/1/OverWatch/AnimatedShots/Overwatch_TheatricalTeaser_WeAreOverwatch_zhCN.mp4" preload="auto" poster="media/sintel.jpg">
						<source src="media/sintel.ogg" type='video/ogg; codecs="theora, vorbis"'>
						<source src="https://blz-videos.nosdn.127.net/1/OverWatch/AnimatedShots/Overwatch_TheatricalTeaser_WeAreOverwatch_zhCN.mp4" type='video/mp4; codecs="avc1.4D401E, mp4a.40.2"'>
						<p>抱歉,但您的浏览器不支持视频格式.</p>
					</video>
					<button class="action action--play action--shown" aria-label="Play Video"></button>
				</div>
				<div class="intro intro--shown">
					<div class="intro__side">
						<h2 class="intro__title">
							<span class="intro__up">电 影 馆<em>出 品</em></span>
							<span class="intro__down">Sintel <span class="intro__partial"><em>by</em>  The current film </span></span>
						</h2>
					</div>
					<div class="intro__side">
						<button class="action action--seats">选择您的座位</button>
					</div>
				</div>
			</div>
		</div>
		<div class="cube__side cube__side--left"></div>
		<div class="cube__side cube__side--right"></div>
		<div class="cube__side cube__side--top"></div>
		<div class="rows rows--large">
			<div class="row">
				<div data-seat="A1" class="row__seat"></div>
				<div data-seat="A2" class="row__seat"></div>
				<div data-seat="A3" class="row__seat"></div>
				<div data-seat="A4" class="row__seat"></div>
				<div data-seat="A5" class="row__seat"></div>
				<div data-seat="A6" class="row__seat"></div>
				<div data-seat="A7" class="row__seat"></div>
				<div data-seat="A8" class="row__seat"></div>
				<div data-seat="A9" class="row__seat"></div>
				<div data-seat="A10" class="row__seat"></div>
				<div data-seat="A11" class="row__seat"></div>
				<div data-seat="A12" class="row__seat"></div>
				<div data-seat="A13" class="row__seat"></div>
				<div data-seat="A14" class="row__seat"></div>
				<div data-seat="A15" class="row__seat"></div>
				<div data-seat="A16" class="row__seat"></div>
				<div data-seat="A17" class="row__seat"></div>
				<div data-seat="A18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="B1" class="row__seat"></div>
				<div data-seat="B2" class="row__seat"></div>
				<div data-seat="B3" class="row__seat"></div>
				<div data-seat="B4" class="row__seat"></div>
				<div data-seat="B5" class="row__seat"></div>
				<div data-seat="B6" class="row__seat"></div>
				<div data-seat="B7" class="row__seat"></div>
				<div data-seat="B8" class="row__seat"></div>
				<div data-seat="B9" class="row__seat"></div>
				<div data-seat="B10" class="row__seat"></div>
				<div data-seat="B11" class="row__seat"></div>
				<div data-seat="B12" class="row__seat"></div>
				<div data-seat="B13" class="row__seat"></div>
				<div data-seat="B14" class="row__seat"></div>
				<div data-seat="B15" class="row__seat"></div>
				<div data-seat="B16" class="row__seat"></div>
				<div data-seat="B17" class="row__seat"></div>
				<div data-seat="B18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="C1" class="row__seat"></div>
				<div data-seat="C2" class="row__seat"></div>
				<div data-seat="C3" class="row__seat"></div>
				<div data-seat="C4" class="row__seat"></div>
				<div data-seat="C5" class="row__seat"></div>
				<div data-seat="C6" class="row__seat"></div>
				<div data-seat="C7" class="row__seat"></div>
				<div data-seat="C8" class="row__seat"></div>
				<div data-seat="C9" class="row__seat"></div>
				<div data-seat="C10" class="row__seat"></div>
				<div data-seat="C11" class="row__seat"></div>
				<div data-seat="C12" class="row__seat"></div>
				<div data-seat="C13" class="row__seat"></div>
				<div data-seat="C14" class="row__seat"></div>
				<div data-seat="C15" class="row__seat"></div>
				<div data-seat="C16" class="row__seat"></div>
				<div data-seat="C17" class="row__seat"></div>
				<div data-seat="C18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="D1" class="row__seat"></div>
				<div data-seat="D2" class="row__seat"></div>
				<div data-seat="D3" class="row__seat"></div>
				<div data-seat="D4" class="row__seat"></div>
				<div data-seat="D5" class="row__seat"></div>
				<div data-seat="D6" class="row__seat"></div>
				<div data-seat="D7" class="row__seat"></div>
				<div data-seat="D8" class="row__seat"></div>
				<div data-seat="D9" class="row__seat"></div>
				<div data-seat="D10" class="row__seat"></div>
				<div data-seat="D11" class="row__seat"></div>
				<div data-seat="D12" class="row__seat"></div>
				<div data-seat="D13" class="row__seat"></div>
				<div data-seat="D14" class="row__seat"></div>
				<div data-seat="D15" class="row__seat"></div>
				<div data-seat="D16" class="row__seat"></div>
				<div data-seat="D17" class="row__seat"></div>
				<div data-seat="D18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="E1" class="row__seat"></div>
				<div data-seat="E2" class="row__seat"></div>
				<div data-seat="E3" class="row__seat"></div>
				<div data-seat="E4" class="row__seat"></div>
				<div data-seat="E5" class="row__seat"></div>
				<div data-seat="E6" class="row__seat"></div>
				<div data-seat="E7" class="row__seat"></div>
				<div data-seat="E8" class="row__seat"></div>
				<div data-seat="E9" class="row__seat"></div>
				<div data-seat="E10" class="row__seat"></div>
				<div data-seat="E11" class="row__seat"></div>
				<div data-seat="E12" class="row__seat"></div>
				<div data-seat="E13" class="row__seat"></div>
				<div data-seat="E14" class="row__seat"></div>
				<div data-seat="E15" class="row__seat"></div>
				<div data-seat="E16" class="row__seat"></div>
				<div data-seat="E17" class="row__seat"></div>
				<div data-seat="E18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="F1" class="row__seat"></div>
				<div data-seat="F2" class="row__seat"></div>
				<div data-seat="F3" class="row__seat"></div>
				<div data-seat="F4" class="row__seat"></div>
				<div data-seat="F5" class="row__seat"></div>
				<div data-seat="F6" class="row__seat"></div>
				<div data-seat="F7" class="row__seat"></div>
				<div data-seat="F8" class="row__seat"></div>
				<div data-seat="F9" class="row__seat"></div>
				<div data-seat="F10" class="row__seat"></div>
				<div data-seat="F11" class="row__seat"></div>
				<div data-seat="F12" class="row__seat"></div>
				<div data-seat="F13" class="row__seat"></div>
				<div data-seat="F14" class="row__seat"></div>
				<div data-seat="F15" class="row__seat"></div>
				<div data-seat="F16" class="row__seat"></div>
				<div data-seat="F17" class="row__seat"></div>
				<div data-seat="F18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="G1" class="row__seat"></div>
				<div data-seat="G2" class="row__seat"></div>
				<div data-seat="G3" class="row__seat"></div>
				<div data-seat="G4" class="row__seat"></div>
				<div data-seat="G5" class="row__seat"></div>
				<div data-seat="G6" class="row__seat"></div>
				<div data-seat="G7" class="row__seat"></div>
				<div data-seat="G8" class="row__seat"></div>
				<div data-seat="G9" class="row__seat"></div>
				<div data-seat="G10" class="row__seat"></div>
				<div data-seat="G11" class="row__seat"></div>
				<div data-seat="G12" class="row__seat"></div>
				<div data-seat="G13" class="row__seat"></div>
				<div data-seat="G14" class="row__seat"></div>
				<div data-seat="G15" class="row__seat"></div>
				<div data-seat="G16" class="row__seat"></div>
				<div data-seat="G17" class="row__seat"></div>
				<div data-seat="G18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="H1" class="row__seat"></div>
				<div data-seat="H2" class="row__seat"></div>
				<div data-seat="H3" class="row__seat"></div>
				<div data-seat="H4" class="row__seat"></div>
				<div data-seat="H5" class="row__seat"></div>
				<div data-seat="H6" class="row__seat"></div>
				<div data-seat="H7" class="row__seat"></div>
				<div data-seat="H8" class="row__seat"></div>
				<div data-seat="H9" class="row__seat"></div>
				<div data-seat="H10" class="row__seat"></div>
				<div data-seat="H11" class="row__seat"></div>
				<div data-seat="H12" class="row__seat"></div>
				<div data-seat="H13" class="row__seat"></div>
				<div data-seat="H14" class="row__seat"></div>
				<div data-seat="H15" class="row__seat"></div>
				<div data-seat="H16" class="row__seat"></div>
				<div data-seat="H17" class="row__seat"></div>
				<div data-seat="H18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="I1" class="row__seat"></div>
				<div data-seat="I2" class="row__seat"></div>
				<div data-seat="I3" class="row__seat"></div>
				<div data-seat="I4" class="row__seat"></div>
				<div data-seat="I5" class="row__seat"></div>
				<div data-seat="I6" class="row__seat"></div>
				<div data-seat="I7" class="row__seat"></div>
				<div data-seat="I8" class="row__seat"></div>
				<div data-seat="I9" class="row__seat"></div>
				<div data-seat="I10" class="row__seat"></div>
				<div data-seat="I11" class="row__seat"></div>
				<div data-seat="I12" class="row__seat"></div>
				<div data-seat="I13" class="row__seat"></div>
				<div data-seat="I14" class="row__seat"></div>
				<div data-seat="I15" class="row__seat"></div>
				<div data-seat="I16" class="row__seat"></div>
				<div data-seat="I17" class="row__seat"></div>
				<div data-seat="I18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="J1" class="row__seat"></div>
				<div data-seat="J2" class="row__seat"></div>
				<div data-seat="J3" class="row__seat"></div>
				<div data-seat="J4" class="row__seat"></div>
				<div data-seat="J5" class="row__seat"></div>
				<div data-seat="J6" class="row__seat"></div>
				<div data-seat="J7" class="row__seat"></div>
				<div data-seat="J8" class="row__seat"></div>
				<div data-seat="J9" class="row__seat"></div>
				<div data-seat="J10" class="row__seat"></div>
				<div data-seat="J11" class="row__seat"></div>
				<div data-seat="J12" class="row__seat"></div>
				<div data-seat="J13" class="row__seat"></div>
				<div data-seat="J14" class="row__seat"></div>
				<div data-seat="J15" class="row__seat"></div>
				<div data-seat="J16" class="row__seat"></div>
				<div data-seat="J17" class="row__seat"></div>
				<div data-seat="J18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="K1" class="row__seat"></div>
				<div data-seat="K2" class="row__seat"></div>
				<div data-seat="K3" class="row__seat"></div>
				<div data-seat="K4" class="row__seat"></div>
				<div data-seat="K5" class="row__seat"></div>
				<div data-seat="K6" class="row__seat"></div>
				<div data-seat="K7" class="row__seat"></div>
				<div data-seat="K8" class="row__seat"></div>
				<div data-seat="K9" class="row__seat"></div>
				<div data-seat="K10" class="row__seat"></div>
				<div data-seat="K11" class="row__seat"></div>
				<div data-seat="K12" class="row__seat"></div>
				<div data-seat="K13" class="row__seat"></div>
				<div data-seat="K14" class="row__seat"></div>
				<div data-seat="K15" class="row__seat"></div>
				<div data-seat="K16" class="row__seat"></div>
				<div data-seat="K17" class="row__seat"></div>
				<div data-seat="K18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="L1" class="row__seat"></div>
				<div data-seat="L2" class="row__seat"></div>
				<div data-seat="L3" class="row__seat"></div>
				<div data-seat="L4" class="row__seat"></div>
				<div data-seat="L5" class="row__seat"></div>
				<div data-seat="L6" class="row__seat"></div>
				<div data-seat="L7" class="row__seat"></div>
				<div data-seat="L8" class="row__seat"></div>
				<div data-seat="L9" class="row__seat"></div>
				<div data-seat="L10" class="row__seat"></div>
				<div data-seat="L11" class="row__seat"></div>
				<div data-seat="L12" class="row__seat"></div>
				<div data-seat="L13" class="row__seat"></div>
				<div data-seat="L14" class="row__seat"></div>
				<div data-seat="L15" class="row__seat"></div>
				<div data-seat="L16" class="row__seat"></div>
				<div data-seat="L17" class="row__seat"></div>
				<div data-seat="L18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="M1" class="row__seat"></div>
				<div data-seat="M2" class="row__seat"></div>
				<div data-seat="M3" class="row__seat"></div>
				<div data-seat="M4" class="row__seat"></div>
				<div data-seat="M5" class="row__seat"></div>
				<div data-seat="M6" class="row__seat"></div>
				<div data-seat="M7" class="row__seat"></div>
				<div data-seat="M8" class="row__seat"></div>
				<div data-seat="M9" class="row__seat"></div>
				<div data-seat="M10" class="row__seat"></div>
				<div data-seat="M11" class="row__seat"></div>
				<div data-seat="M12" class="row__seat"></div>
				<div data-seat="M13" class="row__seat"></div>
				<div data-seat="M14" class="row__seat"></div>
				<div data-seat="M15" class="row__seat"></div>
				<div data-seat="M16" class="row__seat"></div>
				<div data-seat="M17" class="row__seat"></div>
				<div data-seat="M18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="N1" class="row__seat"></div>
				<div data-seat="N2" class="row__seat"></div>
				<div data-seat="N3" class="row__seat"></div>
				<div data-seat="N4" class="row__seat"></div>
				<div data-seat="N5" class="row__seat"></div>
				<div data-seat="N6" class="row__seat"></div>
				<div data-seat="N7" class="row__seat"></div>
				<div data-seat="N8" class="row__seat"></div>
				<div data-seat="N9" class="row__seat"></div>
				<div data-seat="N10" class="row__seat"></div>
				<div data-seat="N11" class="row__seat"></div>
				<div data-seat="N12" class="row__seat"></div>
				<div data-seat="N13" class="row__seat"></div>
				<div data-seat="N14" class="row__seat"></div>
				<div data-seat="N15" class="row__seat"></div>
				<div data-seat="N16" class="row__seat"></div>
				<div data-seat="N17" class="row__seat"></div>
				<div data-seat="N18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="O1" class="row__seat"></div>
				<div data-seat="O2" class="row__seat"></div>
				<div data-seat="O3" class="row__seat"></div>
				<div data-seat="O4" class="row__seat"></div>
				<div data-seat="O5" class="row__seat"></div>
				<div data-seat="O6" class="row__seat"></div>
				<div data-seat="O7" class="row__seat"></div>
				<div data-seat="O8" class="row__seat"></div>
				<div data-seat="O9" class="row__seat"></div>
				<div data-seat="O10" class="row__seat"></div>
				<div data-seat="O11" class="row__seat"></div>
				<div data-seat="O12" class="row__seat"></div>
				<div data-seat="O13" class="row__seat"></div>
				<div data-seat="O14" class="row__seat"></div>
				<div data-seat="O15" class="row__seat"></div>
				<div data-seat="O16" class="row__seat"></div>
				<div data-seat="O17" class="row__seat"></div>
				<div data-seat="O18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="P1" class="row__seat"></div>
				<div data-seat="P2" class="row__seat"></div>
				<div data-seat="P3" class="row__seat"></div>
				<div data-seat="P4" class="row__seat"></div>
				<div data-seat="P5" class="row__seat"></div>
				<div data-seat="P6" class="row__seat"></div>
				<div data-seat="P7" class="row__seat"></div>
				<div data-seat="P8" class="row__seat"></div>
				<div data-seat="P9" class="row__seat"></div>
				<div data-seat="P10" class="row__seat"></div>
				<div data-seat="P11" class="row__seat"></div>
				<div data-seat="P12" class="row__seat"></div>
				<div data-seat="P13" class="row__seat"></div>
				<div data-seat="P14" class="row__seat"></div>
				<div data-seat="P15" class="row__seat"></div>
				<div data-seat="P16" class="row__seat"></div>
				<div data-seat="P17" class="row__seat"></div>
				<div data-seat="P18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="Q1" class="row__seat"></div>
				<div data-seat="Q2" class="row__seat"></div>
				<div data-seat="Q3" class="row__seat"></div>
				<div data-seat="Q4" class="row__seat"></div>
				<div data-seat="Q5" class="row__seat"></div>
				<div data-seat="Q6" class="row__seat"></div>
				<div data-seat="Q7" class="row__seat"></div>
				<div data-seat="Q8" class="row__seat"></div>
				<div data-seat="Q9" class="row__seat"></div>
				<div data-seat="Q10" class="row__seat"></div>
				<div data-seat="Q11" class="row__seat"></div>
				<div data-seat="Q12" class="row__seat"></div>
				<div data-seat="Q13" class="row__seat"></div>
				<div data-seat="Q14" class="row__seat"></div>
				<div data-seat="Q15" class="row__seat"></div>
				<div data-seat="Q16" class="row__seat"></div>
				<div data-seat="Q17" class="row__seat"></div>
				<div data-seat="Q18" class="row__seat"></div>
			</div>
			<div class="row">
				<div data-seat="R1" class="row__seat"></div>
				<div data-seat="R2" class="row__seat"></div>
				<div data-seat="R3" class="row__seat"></div>
				<div data-seat="R4" class="row__seat"></div>
				<div data-seat="R5" class="row__seat"></div>
				<div data-seat="R6" class="row__seat"></div>
				<div data-seat="R7" class="row__seat"></div>
				<div data-seat="R8" class="row__seat"></div>
				<div data-seat="R9" class="row__seat"></div>
				<div data-seat="R10" class="row__seat"></div>
				<div data-seat="R11" class="row__seat"></div>
				<div data-seat="R12" class="row__seat"></div>
				<div data-seat="R13" class="row__seat"></div>
				<div data-seat="R14" class="row__seat"></div>
				<div data-seat="R15" class="row__seat"></div>
				<div data-seat="R16" class="row__seat"></div>
				<div data-seat="R17" class="row__seat"></div>
				<div data-seat="R18" class="row__seat"></div>
			</div>
		</div>
		<!-- /rows -->
	</div><!-- /cube -->
</div><!-- /container -->
<div class="plan">
	<h3 class="plan__title">座 位 安 排</h3>
	<div class="rows rows--mini">
		<%
			//取得数据库连接conn
			Connection conn= DriverManager.getConnection(url, dbuser, dbpwd);;
			PreparedStatement ps=null;
			ResultSet rs=null;
			//声明数据库字段
			int id=0;
			int free;
			String seat="";
			String num="";
			String totle="";
			ResultSet tableRS = null;
			HttpSession session2 = request.getSession();
			String where = (String) session2.getAttribute("seats");

			try
			{
				conn = DButil.getConnection();
				DatabaseMetaData dbmd=conn.getMetaData();
				tableRS = dbmd.getTables(null, null,  where, null );
				if (tableRS.next()){
					String sql="select * from "+where+" ";
					ps = (PreparedStatement) conn.prepareStatement(sql);
					rs = ps.executeQuery();
					while(rs.next())
					{
						id = id+1;
						if (id==1){
							out.println("<div class=\"row\">");
						}
						free = rs.getInt("free");
						if (free == 1){
                           out.println("<div class=\"row__seat row__seat--reserved\"></div>");
						}else {
							out.println("<div class=\"row__seat tooltip\" data-tooltip="+rs.getString("seats")+"></div>");
						}
						if (id == 18){
							out.println("</div>");
							id =0;
						}

					}
				}
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
			finally
			{
				try
				{
					if(rs!=null)
						rs.close();
				}
				catch (SQLException e)
				{
					e.printStackTrace();
				}
				finally
				{
					try
					{
						if(ps!=null)
							ps.close();
					}
					catch (SQLException e)
					{
						e.printStackTrace();
					}
					finally
					{
						try
						{
							if(conn!=null)
								conn.close();
						}
						catch (SQLException e)
						{
							e.printStackTrace();
						}
					}
				}
			}

		%>

	</div>
	<!-- /rows -->
	<ul class="legend">
		<li class="legend__item legend__item--free">空闲</li>
		<li class="legend__item legend__item--reserved">已售</li>
		<li class="legend__item legend__item--selected">可购买</li>
	</ul>
	<a href="Payment.jsp"><button class="action action--buy">购  票</button></a>
</div><!-- /plan -->
<button class="action action--lookaround action--disabled" arial-label="Unlook View"></button>
<script src="js/classie.js"></script>
<script src="js/main1.js"></script>

</body>
</html>