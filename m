Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFD1314A63
	for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 22:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765752430; cv=none; b=XP92Ra3u7Rw/l6HrtLuD59Y1bVPKX9r9sAuaGsgWzJYGEEKc/ck6WE8ZTO1syky2kz0Y3NGPF5du2SiifAXtTWmGR3UTCF3Pzzc6dWawVLK/sl5SQiVKr08gyNlxFUwYfGtwUcCwnbcfd0MErWu03v4NwZ48Z5AiHMzKeoQRe68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765752430; c=relaxed/simple;
	bh=6foIMWkM39YpRsrHkcMuBplG96nIcvxZ8pyBc0baPBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5wFNFNrCXgZQRr2jCoYaqLh7F18Ye2ecKWv7vWvAcfk0uT4M6fE5zqqcE+LwMV+6rbCML4gEVFt/5xbWFkaVwY+zf0g8x8AwClUiL0Joab9afq64TB5l4RdqjrJxDW0A8VDwCNZU73lrkDtJyrHzvxmaP5UZo6VFGDNKP8MBGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Izy6msZv; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Izy6msZv"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so2940497a12.0
        for <sophgo@lists.linux.dev>; Sun, 14 Dec 2025 14:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765752428; x=1766357228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=Izy6msZvl4eB7Smn6XULuQFKj5eOPN3vMaIF65c+rUQgmzD8f2RroyUACo5l1L8jw6
         iqrOOUIGbVA3txIKRAIz+in/QKTtPjQm0QmuMfr6zta9wheQJTTLfiFlWFGgbo6jDZQO
         vwDhRXOA+lIhirF6UEZUYrUDNquE/qadBZM9gmm0PJmCPA5/igZBIpp4u9J7f3W1KCf8
         GWY4Hdv1+Ln4MxKYpJmsuanOWuTvIH/VjM3LgRAmytRT0YgvVMtyBAwxsL6qntJU2orG
         /CB5lWqNbh2byfS5mom2rnMeMGqNIq0ksgIWXtUolxV24UPJ7oX3GwomVRsGzERcE+Th
         ying==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765752428; x=1766357228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=rREbL+Xf9/CHz5ylCPgwXJtt+1oYEKF66yPEUmk7RgqRpUUlRnQBnSOGNUyceObwVK
         XI9LUbL+LwedTzydvd80UuFKHkYFkrozB1c8vXaUmPJ4XLNEQGxX+KwT3EbqItMT9Rv2
         mdkMDhc9CkkBuVSnSQQpJ2Srfp6PJa+tN61FjziH9QxXiJREv2bPMvE8tXdpZ2ICRxZj
         5gflLD8T2gS+VJn1miB1hOv/+T4Cm1vd9mEGASHvjIZ89n1c9rFNJvoPF5jfb0pmhRfq
         wYlAdDVkZp6IGzwi4Dwo0NdM09Hwmuk6aqiU8mcf7Tnxi5TIQiOctBvdiNH1VSv/U5Cv
         BDiw==
X-Forwarded-Encrypted: i=1; AJvYcCXE/2zlytd8mFWgTd/C4ZG1U9E5UV/M+rtuoMHKGSaJHOtTnfx23uxm/k6+0+BYsO4rGDCOayk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnrI0C8PrJ9+f7unwrU6jKFLKx0HwQ6Zb3sqMBMR80w5UGAdZu
	5ANILlcMq1DzKsn6380IHwq+hdmKtmfBuXncbh7g4gvcyR0i9rqJgW5U
X-Gm-Gg: AY/fxX6V2OoPDRPGoGI4S4+p+4kESm/8yzzV8HWSY4GoVRArvry4jNYeoo677hBmwkt
	hT85IxLYiLg4t8GhsWAUpNKqbR1u0zAyTT9FA7DKqELw/g8dS1whzHIZTA+bRCplf4XspRp0XUw
	Ifo38GTWje4qTO8sonUrX6xBhT+drmN/f+A9wX92JkK0Kub71gwJVVnW19T7dEfnyXEtoYUo0m1
	c1JS7J48TTly7fo+RradFMo6MTf4to2dyypBbnM2EuHszXuexAyK4yIWCU4aYrIjnYDI3/zQ5LV
	eqIgzbzA62C77LByMS+uCwzT5mmtucT/ULFKIQlk9MHs+Y3uH2q/SxQv3Th6W2l0GX6SCGEcSCA
	8yWH+W9OTgv6257IARKaQCG8Qj+s2bxs35O/AR0BjVSn5ceahjcg9s61tItfL+y7cRbI5KZzL4v
	S0PNqwSvk6Fw==
X-Google-Smtp-Source: AGHT+IGzU40Bf02ZiunUmBQwqZQkwop4QCe+bNWbYKaguM5GeKAWWOUq5wkMBFK8h0HWejlWKzSlNA==
X-Received: by 2002:a05:693c:6014:b0:2a4:3592:cf64 with SMTP id 5a478bee46e88-2ac3018c2e3mr7575976eec.8.1765752427907;
        Sun, 14 Dec 2025 14:47:07 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac191ba0fesm25394683eec.3.2025.12.14.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 14:47:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v2 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Mon, 15 Dec 2025 06:45:58 +0800
Message-ID: <20251214224601.598358-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214224601.598358-1-inochiama@gmail.com>
References: <20251214224601.598358-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index a393a33c8908..0b5c8314e25e 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - sophgo,cv1800b-axi-dma
       - starfive,jh7110-axi-dma
       - starfive,jh8100-axi-dma
 
-- 
2.52.0

