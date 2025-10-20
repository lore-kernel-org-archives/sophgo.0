Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296042BD012
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 03:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931257; cv=none; b=cl5bCTervxDuZH81N6XNoVAVp9Ek8wzbA9DUj7mIU7FyqilCx/eGEbUg3SVX6aw9UkDjZS+xuyYURjv8b9FxPAXtbfYnG/KSXKqikF8bOHX9HmRxgjeOtFi46R7zeTN+rjZwzOwJsXxZkYl3F2FXQr+3p4xD5wqdOw62D8prdBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931257; c=relaxed/simple;
	bh=dgpNPFFxsdIAjczNzjU4PLG/4kOomJBC5GhTApKNwOw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TULRr0Muy0Ws3scu9915tyxzEab0U+H3YyYL9NydVjwiToA5hjpPJuEcj7C+rw3KPPBuMDmbHxsZnLXXrZMfKAXK+rgrf6IEkG18/HlVcAVoyREKhovV3tRBjeHiKCQsF3S+YeMaXnSqOHkg/YAjQCOTA8dnxM74fyWXZLz/uX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IxCSGXH5; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IxCSGXH5"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-651c586125fso726248eaf.1
        for <sophgo@lists.linux.dev>; Sun, 19 Oct 2025 20:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931255; x=1761536055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=IxCSGXH55AcGDI6L0wgbBP/YHrZQmq/Dsl0TVMUn2cZVXeO6xvYqygvMsByz74mftU
         wASyrPa+9Mg9svdEgDFZ9J9n3kPidHeS5PqFfEfR2QGcwnQ6Sv2rSYes68Q5XF537V4n
         vPZtaSEKdzWBc7fUxfW7M0hUpZGn2/xL1AQLjP4L7aCNnqvMCYpo326e5nxMXRQx/OON
         T0YL6IViRSyEEKZ7xg09QzjkHaFPT1ItevstZ/YdZc1C3lJIMbxAbMHP3PzgaFH1u0TC
         oMaO32Xg2I7any8fuF4kimlYYxuZbB9Xi5em1xNFaHhCz7sQLZI0xa+UhogAfIchI3iS
         Un0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931255; x=1761536055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rSqoF1bhRIMRZ/Ngttka/3cr36QgYmwYc1FwmVj14E=;
        b=W6EReMGkQERBMtXdyfrTbWBq5TlcsiY1kPda7WLE1Q7nAHHfTqrcv5t4I8vmxyJuw0
         WkPE9h1lQBZYit6AmmSPv/DlPoucdt914yv7l1vntGf8Szoftq+mwmCVOPdkeDYrh4k4
         MZMNv6BpI+vMmDa3umqgi4d5SGIg+18xR1xTH0XbBjERNCmfEH9gFIjY+LgZfo+ymr85
         kyxWRGzHe2+zSGs5wfNhleior9Xziypfb4/xkXV6HwgLiXgsmJ6R6qq7XOMaJoI5ZgZn
         PSvmiqcabOVvYoyTGu25+Z0kbbaID3lTn4tl865vj+uJ6ljOo1L6ymfPSHcohs8zKKOI
         QNxA==
X-Forwarded-Encrypted: i=1; AJvYcCUInRk7UuSvB58RGkRdOxMUvgfLxeQl91cKJL71r/aOs5NhtJu9XGitXjoxmuZcl/3S+ivRkVs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaQraUnxmKTgNcQAKOZkZwfT+ivGh+QDKkNFu23AbriOPWgj7y
	QThvEfvVQKG/X0PtfCrEKat0ybJOvTbFPK5WA3yibBq6KOVxsGbPONw5
X-Gm-Gg: ASbGncutzazB6QOga0obfC1nSet7Px/2pJg8ENkb1GYOzFRY/sYMHthne6I95myjeDY
	571SZC8xikzaOQiaksotWLEYbTN+Hu9kmtmzZVfytpfBVYzE6pdFdEjBCMBiN6XUCnx6yKftrl6
	jvbBi/+Gbk+U5yTf7pDI1Z4fzLAFWKvBYiJEdBJN76M/TTvaF8VnYqp1wP2lZhsi/E/nuz7ggUs
	r9Wz02GYt+olk4Vbi68XPCyjaj4KroTiYV0xMwgYVWMqL4PzTf2UeKQcEJ3zoLUFGJosqMun7FN
	L5xB58NeDcitM0ii9d4dPREbaOeR0TSf50eOcB6AeF+EAql+eTtfQIlfe9LVugpk6mBruhXgzaD
	2QYPu3LTYtWJZb0EiD63JB22S00UG2x8CKQqFlTjHmgIURUDr7T7ZnYdVHzhyVmsVyV8yUvKalz
	FST3HounjdBlcm0595Ytue
X-Google-Smtp-Source: AGHT+IE9q9Mk98lP6hBRl0yUU492JUXYJJQ2DgdO+Y4L3lDypf5RtaLyuDaSNhzNdoqOYTgHdrMLwA==
X-Received: by 2002:a05:6870:2b12:b0:331:9036:6151 with SMTP id 586e51a60fabf-3c98cf43502mr5122705fac.4.1760931255070;
        Sun, 19 Oct 2025 20:34:15 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3c9aefc51c7sm1878073fac.8.2025.10.19.20.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:34:13 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	rabenda.cn@gmail.com,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	mani@kernel.org,
	liujingqi@lanxincomputing.com,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 2/4] riscv: sophgo: dts: enable PCIe for PioneerBox
Date: Mon, 20 Oct 2025 11:34:05 +0800
Message-Id: <ec474c5eefb79626dd6a4d65454da9109aaf2f4d.1760929111.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1760929111.git.unicorn_wang@outlook.com>
References: <cover.1760929111.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Enable PCIe controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1..c4d5f8d7d4ad 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -128,6 +128,18 @@ uart0-rx-pins {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
+&pcie_rc3 {
+	status = "okay";
+};
+
 &sd {
 	pinctrl-0 = <&sd_cfg>;
 	pinctrl-names = "default";
-- 
2.34.1

