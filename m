Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC4026A097
	for <sophgo@lists.linux.dev>; Sun,  8 Jun 2025 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425424; cv=none; b=C7BoAN7X7w0kseu6fUa6czpHSo5A2oIiw6fQ/uE2V22w9jxIzT7nzuT1KMp/0WWWyLk/rfoy7+UAfkBm9Ujdq/YUiVJLS7A1QpJt2aCICYtRx9GxJz3GwNfWOl0ItZhzRs2uSQtDLIFgHUoczHpDgdOI1Gwlc+9u7Wd5COHXhHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425424; c=relaxed/simple;
	bh=hKuiKWddi71V1a4NYuKQlXX2OOeDvG86kj/V8uak/Hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BlmK9twYLkte22N+yrsKUmYEBssJW0x06lMktsHlIhlI7SR7tWIdXD+4waPM7E8OdNFzKUJOSN75vT8rwAPl/MwXFGPSFunWh3E8Rs5rgFbLsRp1uX3awAVwBkZz2DeNkFnfrsdtMDCABVNwzzBHcZ4chAyCLoKMgiyJbkROZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkzOYBNI; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkzOYBNI"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so63556916d6.3
        for <sophgo@lists.linux.dev>; Sun, 08 Jun 2025 16:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425420; x=1750030220; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTMiZWOdHSxhmNoMeUDatOOm/HUxNIYFkar2Sv2iSWw=;
        b=CkzOYBNIGvkCnsU6J+fxF9cAgd4M3A9D6dnflvkAoxhIx8FDDRfgI7ua41Y5/tNGDQ
         7AgWkerhW9R/xfCQXIflZXQDQuOkLb1b3qHbn8ON14EIZzzpRNvg3OIk69v43CKtvM5s
         GvaSJrQZQ0R3a/pRCpIum151K6QZU9yKedTQubyrKV6Yvdz9yuZ0h45+kzXlCweylWVt
         AZPZzbtY+ECVJCnvGM4iA8hEnoJRr7UUR9zBqfxr+R0L0R31+eN7qHEHC0cb49uGC7Oq
         8iVs3qm+X697QtofI01YfRwDDfo2/+4TDg5A78C52aW+XOkUG1FlMrAWVUv14J9DgL5p
         8Qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425420; x=1750030220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iTMiZWOdHSxhmNoMeUDatOOm/HUxNIYFkar2Sv2iSWw=;
        b=PKzBlIwJXHVkhLkk+i53TMqRiGwt9En+Ss5+uclZvJFrCC5MM1bzhjMOd0PJZKaYzN
         x9QnXhq1zzH7fWkapQtEJ6cSvE52hHZnQKiZlNek1vQ7NTHQU/1g9rj2hUhMsHzyEFAy
         n+OyPDd8GDJbNdg6WtCxeaTBs4Huvbqy322FS8cxPprKavhUHgGhtOuOyCO2ATLo6qGI
         uRh4I9zSAw7+HTj5V7FQvDA44sFt5KRsNdMeLnyYdndRIS58nnqbax96THibYgIAHO2G
         7ruOv+ftDwsQHIXQ3qdrmwpMNp//K/xrG+Zw5kdAr/VoH+qu4dCAUgNjtgCShOYjdry6
         eSAg==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0qcIpqCcz0LNXaqnSsOjYUM0L6Qwe6c7xmsl08WDN1n5N49mdYYBGh49dc3nylgO8L1LwL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE6c3eBK0BMD1zUl5wLtIZMkODukJgpeGM66lDXJXnwZ3TvGNU
	2Elfedq+bMY3Ws+pt3IEBNdWFw2vNYjJ3WhZFCdh+D1VnDqHhKZurbJV
X-Gm-Gg: ASbGncvkBdOC8GN+Ve2PiovfxK1MvrnN+6G69Z+ymVZ+Tb63cpcFd4ivqAWtvldGeSt
	X6LW8zFmnywP2I/l7viNpOQLytdw/HObRPmKgjwMgDNcx76FajnDZ33ICWVQBTKRDXRPcyMtv1x
	hhJHU8xetod6drxPmdfnnKQJJvejpA1VR08VofAqibVuOq1YuV5geH7UN0hRHsEV6krEn02cgUw
	OUigUTD21Py/y8eEffQr4YJG5ddp0npxIScfJ3O5Oi87GGc1P3M+MoGzXY/taSoue9WEOPt7oTB
	3GnSxr1gEbw18xfLL7KdRZqnxFZhxohBGNsu4g==
X-Google-Smtp-Source: AGHT+IGD9lindtx6ymMs0nT5vWjSjRbMQlERRX74trFsu7rLb4EqGbCLgdn+/nyXchTLQeK+DBIMwQ==
X-Received: by 2002:a05:6214:d02:b0:6fa:cc39:90 with SMTP id 6a1803df08f44-6fb08fcd546mr174099416d6.29.1749425420312;
        Sun, 08 Jun 2025 16:30:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09ab94casm44170066d6.12.2025.06.08.16.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:30:20 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 11/11] riscv: dts: sophgo: add pwm controller for SG2044
Date: Mon,  9 Jun 2025 07:28:35 +0800
Message-ID: <20250608232836.784737-12-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Longbin Li <looong.bin@gmail.com>

Add pwm device node for SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
index 01340f21848f..b50c3a872d8b 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
@@ -63,6 +63,10 @@ mcu: syscon@17 {
 	};
 };
 
+&pwm {
+	status = "okay";
+};
+
 &sd {
 	bus-width = <4>;
 	no-sdio;
diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index b65e491deb8f..f88cabe75790 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -347,6 +347,16 @@ portc: gpio-controller@0 {
 			};
 		};
 
+		pwm: pwm@704000c000 {
+			compatible = "sophgo,sg2044-pwm";
+			reg = <0x70 0x4000c000 0x0 0x1000>;
+			#pwm-cells = <3>;
+			clocks = <&clk CLK_GATE_APB_PWM>;
+			clock-names = "apb";
+			resets = <&rst RST_PWM>;
+			status = "disabled";
+		};
+
 		syscon: syscon@7050000000 {
 			compatible = "sophgo,sg2044-top-syscon", "syscon";
 			reg = <0x70 0x50000000 0x0 0x1000>;
-- 
2.49.0

