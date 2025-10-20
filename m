Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5791C8606
	for <sophgo@lists.linux.dev>; Mon, 20 Oct 2025 03:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931619; cv=none; b=Mr0eJk5I0pPZxGgqnSntQa9wOgJ44ovxjQVJlJtQ/plovhNCDipW7hJ7thuNc6UX5J5ng3lwKOYtFzoZunCq3XxZolakFdBqbv9blYFf08XJEjM9luL7K14TNuxqRzH1QRsO1bEH6x0e2VkQhvn/URztDO73oOtUBTjuyw0wRMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931619; c=relaxed/simple;
	bh=+sDUkA3o71u4xm0yCZaBibtMSUQ/NK+r5JUrUR+q7Ew=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BYOtZjdnSSTpwlry5lP3lAuycFSNq4LCd2MzSjxG3VUv6/vhHSaW9lwVzK4nQJBOqxFDbh5qoqn8XjOvD3xz7DWOPQMsOawud0+dBafxndqsWvfBZ+rib87xBHqeyDb8CPINED3lpEBW7a4VmkQRW0H6g3O434SzaErFxT40YB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQsjrDoY; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQsjrDoY"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7c27e5ca2beso987640a34.3
        for <sophgo@lists.linux.dev>; Sun, 19 Oct 2025 20:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760931617; x=1761536417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=EQsjrDoY4MY04U1j0v9eQIgOQdCq8CvEmfD52SEB2oNadd1riYPVfb4UjNrss5jQ/+
         K3xfRvNGEpprTNonJLpuPaxXXFgh7eVMt/DUXCYXoDjQdtj3sHjHVwjclmRZtxg1xsrC
         tDyPOQi3cRaNek8aP2EBrJQhIggwHRPreOzqpTzovQYnSPcWOR6PSKvG998ntdQWY/Xv
         XtUo1w5rDDP2re050Hs5WHfoyqxfrSw0fjavyE1DYUf9gOseMSbQYfU0XhzEammRPLSF
         R+60/OCJeMRT5xYjC4Kac9lLFSG14zl2SCe3/wfRR/bvhWjDIa/QIrhZxv1o2465rgZI
         vNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760931617; x=1761536417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8dXK+URwMz/QYwLwmlxkiqTgmS0zDdGrSZfnYxwO4o=;
        b=Y0iPk2qNu8gYv1qlxPOmHodccWYqYCSvshkRcOBEgIWtutY1IaE5J45Ro/RGyvTj6+
         7FcPva6QtESj6xyqG0aSXkxhCZ8EkvIdzFvI1YCZu1XJnl0gXy3guy+6qirkeo0pHMfv
         X7YZn90VSVuo6NCBomkrF1lnyPhYB8XXA+VhREY5cNTQHod6wGXH7Qss/Je4io70WMuh
         sGlPWZJRZkBPEaHV67CRXRf/L6YqjU6lXbzFVJdKNRn+mfhvFmPmoY03NLW1ABqEGs/G
         ivb7IAW6e8p8LjdBKyLsQhQNPHS1z9+Z4FyFF1vFfks1WPUwwB46hjHZH2tzxO8HdyDC
         9Idg==
X-Forwarded-Encrypted: i=1; AJvYcCX1PkTCUx1AHChdtrQ/zEE0NVF2ercTNoIjy5MhwyWl9eFgYvt4SaM/KOlzNvkUKSzaI1DbfIo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7F/usDZWM+Q37LO35EjXCf5SK51VyHlmciAi6ax8fjRNjtuTP
	jWPGBdCKeWO6+d7ZNb8AoloyKmeh6BE4eTB242K3TJK6kAKrrcMK1AxT
X-Gm-Gg: ASbGncs1aEylnzKsdw+ymIISTLnSUfu/B6LxKtt3nCq7X5fnjDDFSw1Cb9WkSfqvbHA
	kiSa6lxAKQHUc6NcFc7fNj94pi6QQVu1zKyyRx/uREGM9bZyT1rmRqE3++/qTToug8b2EIG1XK3
	oYe9ytyD5yDfJaLeeQfPSxEIT1U/oqJR4SLchM3x3EgoysarSASmPgUV8SmcIgHLkzcj+ZZ+40u
	ohE6tan5wKsadLcm7qYaB0mV/nSMh4V1rKiIMgMGS+QO46GuY1QfVc/q05D7lBsVwbzpWm6IO/t
	8bJg3cpvwl17GQrZLws54BOJraUwDN9SmVWgIqKQERIxTRO8HHXiQk4Fl2QtJ44opyWXPezYnqg
	o3KWdFTO1U/l3hIdMVwYILtIbejWD5U7WTkcODveixxLo7hJAaqJATBAKGRlBuhqo+OYiDGk1nf
	U+wVBWOJeFYA==
X-Google-Smtp-Source: AGHT+IEVqNvKS9S5hpOT/qYLHXX7hyjUj6rvW+z7uFgHoCnVtZJK6EaIoHbVUJTxxJ6dp8W5m9QPZQ==
X-Received: by 2002:a05:6830:910:b0:7bf:75e6:5ba with SMTP id 46e09a7af769-7c27cb0a0dfmr6276999a34.15.1760931616913;
        Sun, 19 Oct 2025 20:40:16 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c28879e8d5sm2272678a34.5.2025.10.19.20.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 20:40:16 -0700 (PDT)
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
Subject: [PATCH 4/4] riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0
Date: Mon, 20 Oct 2025 11:40:09 +0800
Message-Id: <50a753f9b8cbd5a90b5b2df737f87fc77a9b33a7.1760929111.git.unicorn_wang@outlook.com>
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

Enable PCIe controllers for Sophgo SG2042_EVB_V2.0 board,
which uses SG2042 SoC.

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index 46980e41b886..0cd0dc0f537c 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -152,6 +152,18 @@ phy0: phy@0 {
 	};
 };
 
+&pcie_rc0 {
+	status = "okay";
+};
+
+&pcie_rc1 {
+	status = "okay";
+};
+
+&pcie_rc2 {
+	status = "okay";
+};
+
 &pinctrl {
 	emmc_cfg: sdhci-emmc-cfg {
 		sdhci-emmc-wp-pins {
-- 
2.34.1

