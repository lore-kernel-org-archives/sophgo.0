Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61C91B0F31
	for <sophgo@lists.linux.dev>; Sun,  4 May 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746355591; cv=none; b=dCqEM9OdUD4SwfLR+hFtVcqRV5+f9LJP9iHd0Upjn18kgJfVDBbUfamvf4UrmCZjHCexvZQCBR/H/E8T8XkhDLPijhXayL3zdo5ugyQd1Nasi8MGzTjveL7WOyE9mE5rwDZ+Xp7FDhRJMONHPOkADnAokBH0bNxXkW9SaYmA9Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746355591; c=relaxed/simple;
	bh=byR4KjoiUZhFnEtGNh3vbnUqYEIKEWTbub7tpiSooj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nUWJZAufMsk8D0lPe/E3hy9YDwjKpknT/CcmtEQ4u8pSciyVmDtrANrovrvh2bIlmW9OJBRikVjvQYiqYvZdKtpinxNH0s+RXp59ZczVnENq9J9LmLJO3+oPmhPV8Rjl1GPcYCarQTBWQJuztH3WuijmXkIvVvCla3G5SbOWb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5gLtSDA; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5gLtSDA"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6f4e3618437so43589556d6.1
        for <sophgo@lists.linux.dev>; Sun, 04 May 2025 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355588; x=1746960388; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv7/7EvCAlYgtUnyEHnXc7BmIGdTgL1yOUIUImvH/ec=;
        b=L5gLtSDAYmmWBGX6ZtKX0sIidjmYU9Pt+MNw18Q/ZYHGmAG4zQi4oWRr4vHiTMueHY
         zfo3Y0vhKjNhX9NK2LKz/M5w6/ptUPK25P3XP6hnJ5o9P5pFwgmAW/e0XfSAV7Qu2Q6d
         LR00FIRJ/QDboAILwUAtGrVS/T/KpbyBqW49QRQFgU2FugYHY7b6ajBsxiOHdRjG0HJC
         jX6yORecGvAWmikrVF7ISweygOOxAlTTLl//wt7kL+McbRzLBUUl0r7MGvoWq0U7fjsj
         NBcQn/AlcjlqQjkgnbcNkjq8BIaK1KeiIa17PSlI85GhaVI9gSLDdBrs07RFV8eHLDgR
         UORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355588; x=1746960388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv7/7EvCAlYgtUnyEHnXc7BmIGdTgL1yOUIUImvH/ec=;
        b=bKJ+QCQNVx7qwpaFT/rbhvWkm1SH3DTzKLKGC7JWNV9ReL0cJgHrSjoYRE3Rp7rw++
         JD3cdmksiH8pIIZ20danU0j5FRJiVzMk8Xyd0iCiXCa8xc1hA+ryRq8qingiY8uRx1Fy
         7L9aXRbHwvQH6tJoe5yLHJM8Hj+AvNEGdEJ4W6zpME2KtNLyqkVTLZfriPx7TVroB0BK
         DZL4RFMeQexjvR58mZEmOl/+O5klQZQnVUOp+YIm1RgeIkIFot2m4X5w6nIhjHaMLEiH
         xq/MByZ2gsafLe5CEdcGpN1U7+ZRwNBgQy8+gVZDO0Whie2c1U5gQdxnutoQl0edbddU
         YNkg==
X-Forwarded-Encrypted: i=1; AJvYcCW1xEucwAu/Wmlyr906ozwVz6kudg0h2kv+rT8f8WOQ3DxiUnND8wtErtLFEDPhqJCVqU1t/N4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbR9dNJU5d1S9alWSB5SPL35isxxkaPWe062KJt8LkjAH5nJp2
	z628qEPnK9pThOEWFjQFT6WH52PFLPmlfXG6D85Ptm4mIR01SDKS
X-Gm-Gg: ASbGncuKHk2ABeR3dZo78e4+ZHDmgWoY0WZWZ0fz9wzAQcComvSes30c9EgVanmmJ5k
	vTNVeygnQ+oVaaYbuDZIrj/buOxw5qAM7lLn81hLr3/sSiqVnUx/X8uHyAa+pvQVDe6XUHqqIhj
	RCGQMa3SGq7xUv+E9LA1SoSO97g+GusRmZXKpMF+PbiF9q1w11qRzeWTXcPws8S0SIZNln8Y8FU
	5XRp1x3liic1lnuLzLAT129q6E3Slpv4f9FBT4THMReenjoq/wDZBox9d4IRJ/CVccY5577UDby
	zbqMMrV+YP9Zcei2
X-Google-Smtp-Source: AGHT+IFYpImqiuOB3O8DVQFeUND8eQIrOsqgcV+l8Cmmmw+ZJEhkZoQpsjSK0P+vo8PHzjh3eP0gPw==
X-Received: by 2002:ad4:5e87:0:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f528d569e7mr54061806d6.43.1746355588539;
        Sun, 04 May 2025 03:46:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f44f415sm41792616d6.86.2025.05.04.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
Date: Sun,  4 May 2025 18:45:52 +0800
Message-ID: <20250504104553.1447819-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace newly added precise compatible with old one for existed
clock device of CV18XX series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 88707cc13fb4..90de978f69c1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -29,7 +29,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1800-clk";
+			compatible = "sophgo,cv1800b-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 0974955e4e05..9a2a314d3347 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1810-clk";
+			compatible = "sophgo,cv1812h-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f09c9199102..98001cce238e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,sg2000-clk";
+			compatible = "sophgo,sg2002-clk", "sophgo,sg2000-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
-- 
2.49.0

