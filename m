Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF8199931
	for <sophgo@lists.linux.dev>; Thu, 28 Aug 2025 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347511; cv=none; b=i3fLtTbFljs1ZBW6EzumcPpEJrqH+GXSw4uXrhgRd4fdjuMWoBVLFMqz74wMbeYF/M5XzcURWvlsEw3IDRDAi2gfVxUsusysRHPIQXL6U/FvHcw5PsTm/nro0IqCbUQQ6jXHI0dbIgweAXPIu3Zexr6ku8ZF37RbmAQ2XTtpcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347511; c=relaxed/simple;
	bh=2/X0kqXymzl0rSIfFuIwI8HKliLYoWUEKgTpcTzr93w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AcZ8fRL8+ebzpXlCNT8quS0j+JmESJv/3h9o+8BatJMdwlK2D+T6+b7oyc41OwjOXHXRehlc3Vm2+3tJle01bKQy2knYRkEdblMeJ8HnkjsWIF/vGGZhtz1b3LoVlB2KEKFjSekeeMGSgJ+2TzYIsDLGgH2I4/VOaAVFSOKnf1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUNnJAp0; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUNnJAp0"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-61d9c53be51so246173eaf.3
        for <sophgo@lists.linux.dev>; Wed, 27 Aug 2025 19:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347509; x=1756952309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0G0wcA4QwYMRGmntWmLFL5l/S4VJ8/gFReFfYA7/kyM=;
        b=aUNnJAp0fJNrW9RAA6j9dsZkTssHTwOjYmZDNKTdwzHp4eBeedlseet1rXy2qPqyuV
         eFiqpYrs1gSGCzKcTFt9gIV74jo54dwLkZUMRfy87AWtgTgFJ4yd8YQU5qIoSEYAWP44
         RdcU++qZwZHjh+7vYBgfxiYBHO0LBZWYVCEgMXmmJ60755JZuvWLvP5yCirqsAqT23Ku
         7ALf0hDkw8KOg9YdVSaH5Yra+4LZY2GOoXDVmENp36hksv8lAnDL/KLFR7CpnIkTEgnO
         Pbwh5vmqIJz5lBBuUp7vBrXB9fjyI9gg3eKRhSkpUApWPNwUyThvvuUAJ6oqRNbp7oMR
         IY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347509; x=1756952309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0G0wcA4QwYMRGmntWmLFL5l/S4VJ8/gFReFfYA7/kyM=;
        b=W8jRZ1aeQYAg+5mbLQrXimD+vx7gvxQMUnjG6VzZMfGzGdNULkrdX0aQx0SFCJTGCu
         sHt8WruvErQoLMs3MFkuZPAg1gFfTqvl7nZ5HX13ppyTkWcNp2U2U6TZlX3zgXZ06+mv
         Cv/EwrdoYH59OeA1ZcLvQlGvo2V7xvRMMCU14Y64DxcdyvIys3rmyUm60Z5SIKxohc7n
         wJtua82v0We8f4DLnlSLbwurUPO12aGL5xlbN8FYz7PGhEf4yRRP6eEJyjoxUO8Mo/Sh
         oXqoLzuPidqLDmTGpfGnup48ayvILTIPqzzSA1dOlKKJEhSSZ82xjTO+iH9zXMqKzIHK
         NdUw==
X-Forwarded-Encrypted: i=1; AJvYcCXQUEzvmvn+Bc6TIPgtXC+gS6Od3dt6FuIVPwcK8AOd0CGfDn+ZGXHaIOd5goEUv62WbO4BhBg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoPDkL+9pTfTuYwWdbQRgpN0Wkr0K5mUxgKfzXWA3Zg3jCg/e1
	sHhBGY7yE6bSMOnOuQ6kYkF3BFscu9QQCtPhYdzETTYCK9iuXTfRwG+f
X-Gm-Gg: ASbGnctpfLhXC3BXT/5ZMb0Q8DQz4BOXDZbAvjy2GHlC/0HrXgX8XCVUI2RM4uKtoCQ
	1IRrNhZMaKqtE9P+PgQzAopawytMUujCeM93LlCEKKP97HhfBmkQ4cVPwr7KmhzkT0S+A+k0hOJ
	tgwRJKtBsETB3MKlzDtwHZjfamgN8Ak8Cyd2y/UEMXiJfKko2EpJ/7IitFsnyBKFb2tTUII3Mqs
	o8PTg/QIvqsQ7ByKb+GJPvXBU/T64Q8SsdXvScUDf4MnNz0glhw7JRZ38UD4F4AhFvwenN/qTjl
	fYmOeY8HkKSb2U4XXvNPDX3zBks0v1azT4X6TVhlxQXTfdNOimTcq6HWjb15DeNNpYC13TkmxVs
	x00SKmUbUET7meuDJFT4r7t6F9GKvbKb6ywn/kmOpf2Y=
X-Google-Smtp-Source: AGHT+IF/5cS+VdOAcxsOTaHXrHFbinFo1G+/jQXnldj08eaTRkfdS8GuJweSxJytLqtORzEjgcBxBQ==
X-Received: by 2002:a05:6808:690c:b0:40c:f220:67fd with SMTP id 5614622812f47-43785196da3mr10882798b6e.9.1756347509153;
        Wed, 27 Aug 2025 19:18:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7450e297684sm3494054a34.19.2025.08.27.19.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:18:28 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 5/5] riscv: sophgo: dts: enable pcie for PioneerBox
Date: Thu, 28 Aug 2025 10:18:21 +0800
Message-Id: <3c2fef69e80a3e4dde47a9449b49f679211a0c2e.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

Enable pcie controllers for PioneerBox, which uses SG2042 SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1..6574d8e0b369 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -128,6 +128,18 @@ uart0-rx-pins {
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
 &sd {
 	pinctrl-0 = <&sd_cfg>;
 	pinctrl-names = "default";
-- 
2.34.1

