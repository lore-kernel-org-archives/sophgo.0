Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5237D38F24D
	for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 17:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785002054; cv=none; b=Xg0ly9nK8Nlf1yw08UahsdB8g9gWJS/kku8HyaUsuoOd8sR85S8g+Fwj8ssoBo/Oj+cbmFfcqItnNYnY37JXCng7Ry8cJayUKXVsD57eEOBZ8JKSBKh8CP6DkHelxQMOLL9xFnwsCiyHJcr1dYUajSOT8/OoJ120rIiTEb84Fig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785002054; c=relaxed/simple;
	bh=+o5fH8rwESBYY5ifL825WThYyxoglQpkwz83khsjBQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fzg4KzMdmz2AvjBdkBawwPywpMtRFWw8uw7/MfnimmDVhc13KmbhkoFK2YLdN8V9G64eLBoTr9XIZbS4l0kt8NehNTIJ+eoNQzyel1PmjMXjtVLyP3q7jj3YWKbvM63dxlLQzLeNihlofgsa+dj8pvMO5YGvWLp01E0aE16857g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPeqkMlj; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPeqkMlj"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca957338f14so175484a12.1
        for <sophgo@lists.linux.dev>; Sat, 25 Jul 2026 10:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002051; x=1785606851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/C6bg5sGQ3dKnD0unsNwAHtT9/Xl4i7glcJbCRP315s=;
        b=WPeqkMljwH6cmvY6qR1kl6iYWY6kNOEz6iiol32oJcxW5YOmL6+41jU8VfIIIOdAGs
         xz+qu/t6avj19u2TkxXheThv2W+CX0lUkWnWQM3OTJDkArJ7Nuw9PiBBIuYJqmpIuBmr
         6zHD2E4zQ2rq/+aLJalu49x0l5rzbYvZ8lq+mY8kFXQtFAPeGbLlABluBh+EUA+6PBCU
         BHoneM9QUPdxAXZ2XgzfRktjNsJP1KsKOh1G4urzqVVeKtRorRAB1eS806Ol/uQ9nvRr
         1t1ev1rEMf86SJGaVw5LwtF+uEYqLXJqCEfqd7P9RvNFqFbYN5tx2QrUHuu+RdCziTAY
         8sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002051; x=1785606851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/C6bg5sGQ3dKnD0unsNwAHtT9/Xl4i7glcJbCRP315s=;
        b=WpBiOnXwCzE1GV0FhvvgCIFqZkzl9skAAegyFSQoa02b2BH4rJMhYcVF7X3slXeA9X
         S640dwY4y5Xyths9oGOLLg6gUAiBa93pB8lcWQCXO6iz0TpsxggC0gucoPXnZFafYSNi
         zVqPJgV1/avsDuZWNIAPAGdD8wKgNpHCNvAxBxHCfjPkKAbz3tNbwAnJs9tLu81wgeBV
         jj4xQ5RLKvjsWEmjZcZ0P2QtTSnM5jmPClVLjq46myEyL33uZzrHMH8+b4bTMv4iHk8N
         yIyHdl9W37OU25ZopcKw06npu05h5iVtZ7PwTTdj/no2SD3ywl+Jvip78c0eMqceDexa
         oS1Q==
X-Forwarded-Encrypted: i=1; AHgh+RprmfFz/V8txBcbIKhuZWzIVVD46zSB/NfrKHnawyWxfw4cFHQXkQ6t2AUXlb64bWLOfQ0CkN8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhb6oXNIOACLW+do7Igqp5DJDk4/mQsryOxqE9OIvp+e6VgRct
	wxtPMBXqbCMKQjKJEcff1VoiUPXaA5eePbLPBYyOGdr8WdApHY3ttTFy
X-Gm-Gg: AR+sD10VndOnyqk5qRJg/6+tVuF4ozuvOE/uo7duAOS2qhlBVupau/B+V9pJhUcNC1d
	AUCGVib4kbmQfG5Iu4Kamv4IQPFgxVhjWOra7rfv1TueYa2cQsVU9CEYn1hJInPzm6+mHWDgsg0
	/oANXb0I9yb0rus+fMHphW+oX6DjfGQfoIQDteVT66rXf90yy1aKlSbDEPtbgGdkbZVPk8srroJ
	bZ3QJO56UUxo380KdgzxjsQTfLleVIZL/xX40/IJDgkzq5ZeFsfpKlg1TJywV9UlljxYXgv9Q8q
	e5926aZycvFLe+9rfzs8OZTBnASnObLTQOYQoT33BXS5iAkMq+L6A8IQoGLVWXcblrgt7N1G/Ep
	p9kmvDJNp5kZMMbalBj6KZ6BxG/5rSGsoDWuDeYJFYrjV+sTEpG0q0rxTQWxwACxUapNhiJfHjU
	TfSNRI1sYzfCRmCBwL8LnevKumRZwOeV+CvFTz2W8QnVpGqaibfm6+uJ8UvUSu7HcB4PULNN7sh
	gXaP8It7A==
X-Received: by 2002:a17:90b:58e5:b0:37f:eda5:516f with SMTP id 98e67ed59e1d1-38f2926773fmr2113362a91.0.1785002051278;
        Sat, 25 Jul 2026 10:54:11 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:09 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 2/3] riscv: dts: sophgo: cv180x: Add PWR_GPIO controller
Date: Sun, 26 Jul 2026 01:53:44 +0800
Message-ID: <20260725175346.139173-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CV180x/CV181x family has an additional DesignWare APB GPIO
controller (PWR_GPIO) located in the always-on power domain at
0x5021000. Add the node so that boards can reference GPIOs in this
bank, such as status LEDs.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8bf67ee4eca5 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -448,6 +448,24 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		gpio4: gpio@5021000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x5021000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			porte: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				reg = <0>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <SOC_PERIPHERAL_IRQ(54) IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;
-- 
2.43.0

