Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D28279354
	for <sophgo@lists.linux.dev>; Tue,  6 May 2025 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746524014; cv=none; b=gimvjrH/Gg/IvBPGYIRKsxbAICwzCtlntdR+72rm0WBwM4j6HcFOVTmNc66GbRDvWuE4vCtO9sdNWWFPJFmm9EZuN3w/etHMNHmRHm9xVVXqefas43ISZjbKflaVwUOvYrOdkVSoR3FarpMme23Yl5XmAuZC7OT9pnbXjz9H1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746524014; c=relaxed/simple;
	bh=rwdXbDvobFP8gDrbsNPu0n4+UgFNdu2ZqlNO+dHj320=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WmTYmqPN2deoRZ5XI3JDdka3/kgIzSJFzlyfN5Pf3SU6ZVTnwc1MaQ+xTs0TYU/UYUT0eXUlx6oXU9pTHYzVpGIpf7b7yaWHzWWR3i1bRLb+LtDQ+36wbUgZKARtHeeK6grJVa1cUwHhrKHPjtEoMjxMfL66fk6aVbz9vNjsKEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGb/rVSv; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGb/rVSv"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-476b89782c3so66113611cf.1
        for <sophgo@lists.linux.dev>; Tue, 06 May 2025 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746524012; x=1747128812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=;
        b=TGb/rVSvF2kQ7SzZeimCnm6xJOO9UwGnlKZrf8S6E60YVneCKCB2qySiwwKS0Wb9Hz
         Jsr+RNlhFLZnEjVQWX67DU0EW5HvCTtXPkRht7cn4iBfMl4V7K8QDt4SleUWoTsvWW/l
         EGW+ED2D+/i36cszw18dgtJPP4x+Ehff/yG9CqRi1oLsrewsMdfBXpmFtdY8YTlB2Mup
         LaZ0tjyVfwzuBK+SubsFpLZ21hiJ86Za9lOfDZjSeCTJHlSrIxHZU/DB/WsXkOO0FaYB
         ojvP0dYKfs9YVOEWTlt9AFMcw2mZDWbXXS/fWIgabgouYxShlG+PO+xqDptuCHHvFWQX
         ralA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746524012; x=1747128812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7b6FPH7tpbMtyDXufMUwUF6RvC02CLrBmvJ944Zgtpg=;
        b=YaXTW3z1C4JD6EWghMH992SwlA0ej1tMQreXxPPCks7iAW0YqSdE4gQExZuKNf59yg
         zs6pbNjGy0OgCfbXnHmcEJazQCUT9olRmu7WTiAGkSp6LJa5qyex7hEXorC4Be+Hps88
         kNXJ0pzpkNyhTkid5FHpwCjo688r/aUqHt2v48Ekr8n3jbi+JgIdd29E/knzk4/fqqdd
         Kd5F4cMfPvInWsn1FICnoltG0S71u1NprJp5LrBV6aFZageOSm2GpGSBvHfgPHACFkpo
         Y5tR9aUILAp26hOrmWQ0HBryCy5jutE06kElYcDn1I/csTqaoJyiF9LpnpJV3lH7Vw3J
         dFLg==
X-Forwarded-Encrypted: i=1; AJvYcCXv8f150prtTkk5rhXgnUFo8Qq43LU09fJUH5LUlKD7uMiCRjs9PGI1xnTg5DdyGOKTtJV9V8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YybhTkb8RS5LVvUz8a+2AzIWItxKHx8lDdhdVrQ7Ihoo1omzc0w
	/AUmRBbCU0VEbawgpvU75ermR3F4CSbhtPef1ymEzdx0pKX5KaNK
X-Gm-Gg: ASbGncuE3IgLLR8tpLG2rwL8k5AVldcS3bP4BS9v2nkz1PLJht4Iq5dfRA53tHnoSJP
	85bmdTTdWDlmLu6OpigMwKS2z15qU+SxVOV1WkdH6+KrFhH7a6KDvhaYOyUR+SoViLhOiZVaL27
	KmzQz9xEqWlv9lOiykbN2SDYgExUfhsy+x6z+d0PcResiq2F4i/JbH4IZun+HiFmVNi4quICZyM
	AODBuWVDmA5f8osR4Ei5jqv37A0chgFBheMWNSFXXgd+h1My3k8x53G23gHH0vYQGO4CZ/7TbjG
	4M/DfFBREqnSAW3k
X-Google-Smtp-Source: AGHT+IFxXii2pf1jlW5RlCREc3ls2A9Oonn2wTcNloToOzLYm2iAZfy1uAN+qSi/0vm0NCoUaFddKQ==
X-Received: by 2002:a05:622a:199c:b0:48d:e36e:9836 with SMTP id d75a77b69052e-48de36ea26cmr138510361cf.35.1746524011717;
        Tue, 06 May 2025 02:33:31 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-48b987209f1sm69892791cf.52.2025.05.06.02.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:33:31 -0700 (PDT)
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
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH net-next 3/4] net: stmmac: platform: Add snps,dwmac-5.00a IP compatible string
Date: Tue,  6 May 2025 17:32:53 +0800
Message-ID: <20250506093256.1107770-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506093256.1107770-1-inochiama@gmail.com>
References: <20250506093256.1107770-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "snps,dwmac-5.30a" compatible string for 5.00a version that
can avoid to define some platform data in the glue layer.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index c73eff6a56b8..de3098a773ba 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -410,6 +410,7 @@ static const char * const stmmac_gmac4_compats[] = {
 	"snps,dwmac-4.00",
 	"snps,dwmac-4.10a",
 	"snps,dwmac-4.20a",
+	"snps,dwmac-5.00a",
 	"snps,dwmac-5.10a",
 	"snps,dwmac-5.20",
 	"snps,dwmac-5.30a",
-- 
2.49.0

