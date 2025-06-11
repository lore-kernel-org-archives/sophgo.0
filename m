Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFA2356C1
	for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 08:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749629314; cv=none; b=FssD/qOOqU+BzdkWF7n6WIALPggV1t9i2SCSE7g8KRgGRjWUM9IZFsugmcWUHZ7FULcx5EbkybA0apdc3p7s54sJL+4Uq3UuX5hG2i+4cy24CwMP5g+AKVWCTbkN0nkV2GhyeVS4WRm8sasIlvJU9dGF60WD9rT93jh0RUdKooI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749629314; c=relaxed/simple;
	bh=pJPHTm0/+S33mVp0TlQhj25Xaq6F3IiOCyiKOTojx/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=suO1tg8nju/Ikwe+vS4v2wXVFAVQpC87SFeYiR5ka9sbvK+V96mcZq5fSpWxgZ2jM/0GQWhDF4NTUv3DRkel316QHGCV8UB+VfTdNClzMn98QNC9NRkiO0IF905zA+ZSakbcj9GVcI4y+shx2p3+PqQ4e54L1N1B98s8x00o0ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bZ6S2yWy; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bZ6S2yWy"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d38d1eae03so289688485a.2
        for <sophgo@lists.linux.dev>; Wed, 11 Jun 2025 01:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749629312; x=1750234112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eawpl1GdnYK/zxQR8KIApQjP6GTI21JKF4EJB3XYg6o=;
        b=bZ6S2yWytH3o/ZRKzXx7Y12vutbiiP/cPdX0KP1/RKt2fJYFWZMHQsqGTmCnGWMshe
         8NODVBr3YlYx9a0+Dz4IRuE5DiYSj+oTOnL/MkoVzEbH/KSfZmhzquq5Pt/K6LrpHyKt
         NI2OrqdHzUVwlwDlbnvEQkKRB8WbWgvV1B8gcnTufGePk67PkCzpbry/e4Lrum7mRLsJ
         2BhAV9QHC2O0o8TBxivQuPqz0qkoJ4pm3wRdSImFAdlKI+eE1IUe1XIp6SHLj97C+0Nl
         SkNav0/V4ItglqFav8/nk4fL6jcr0+pTWo1Ucw6GdI1wlQA9Cvgc8wY7LClzjlDeXwl4
         sTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749629312; x=1750234112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eawpl1GdnYK/zxQR8KIApQjP6GTI21JKF4EJB3XYg6o=;
        b=PzSz4IA7O/yc+6dM4xaTSyzW/4MhkiTotG3kvSrBCh0k8pCkMZRPcnZwDwsqzuh//Z
         Mo+Saz+bHOOhcg1rWm2AfyDbMaGP3EXMcwStbLH6+Pfg6k8WMHsY4ztcSuf68ZxUHLNy
         EX1YhWKUzS33uCYeBac6XjRHpO0/5CRybZm/ANb1Zz5C9pQwL1WoBt692IIpkBJGqw1e
         0TD/1iDVifvfcquygHaei0Mar3Iboqte/BTz/EB5xdOskOAnXePYIiMP3cNuInuiXDQ5
         AYdZX9isGyEaMo5IHD0DJqamclDLFDefahnXGIylR2d72defR3XDSEFUKep3m0LGBVrJ
         9WlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXU4s5HbVGfS1KrKPiI5ftx9Et3baCgB+ZSw42LLmBqJMy8TPFQekajbf59d76UWAm4HmsxsQM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfCH3dNkibX9wL9MptkixdP+OnjCKzUGUFQ8VD7d3+iAMnzH43
	rHmhXAX6uwN8Yp+5uD3Uh1TZPq7dkpK0RItmxngmSBtNwVsxobuWhUvA
X-Gm-Gg: ASbGncvZnhJ101YfpAkgA3pzRzdBLhsPKBt/R+4miK6GoO/RisLO0EJW22x2zQW1k+e
	ZlhecTmfhuLuntA+CGx9Cm9msY8AxlYxBC+1LmjngqyDImvEyH/P2eWcA4BIBK3ggGLdhS7qNQV
	Qm6u0smQl9sp/gK+YO+aoLCkHjvnzl5sc86L3L4aLB1o6UfTDX6ZXlT0BRDi+fykjU0i9eJkaam
	pkmVg7nW2jDKsTiuHnpLKVVbNfx9txF3f+PUtzxF6JsAhRhd6bzfc1tqghHuo9fYW7JPDLfx67L
	AxYoBjeP7zvwXRDurq+tqNpku50oef7nr/sCrHNTfdR5WJIC
X-Google-Smtp-Source: AGHT+IFnczEgxOSGRihWUwZv2+9Bzf8GJGZO6uYjLD1BPRfJ866LMMcxtdUJOLNxegks0WI+Vt4oPA==
X-Received: by 2002:a05:620a:468f:b0:7d3:9203:206c with SMTP id af79cd13be357-7d3a9546cddmr304354485a.9.1749629312081;
        Wed, 11 Jun 2025 01:08:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4a6198669b7sm85188931cf.67.2025.06.11.01.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 01:08:31 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next RFC 3/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
Date: Wed, 11 Jun 2025 16:07:08 +0800
Message-ID: <20250611080709.1182183-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT device node of mdio multiplexer device for cv18xx SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 7eecc67f896e..929864ba1b26 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -31,6 +31,32 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};
 
+		mdio: mdio@3009000 {
+			compatible = "sophgo,cv1800b-mdio-mux";
+			reg = <0x3009000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			mdio-parent-bus = <&gmac0_mdio>;
+			status = "disabled";
+
+			external_mdio: mdio@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+			};
+
+			internal_mdio: mdio@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				internal_ephy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0>;
+				};
+			};
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
-- 
2.49.0

