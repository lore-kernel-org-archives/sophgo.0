Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376331B4138
	for <sophgo@lists.linux.dev>; Tue, 20 Jan 2026 01:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768873041; cv=none; b=FW1wAu89DNVHSGdZ+f0Du8Od2Yd24mv59/+id9oWUcmU+7KouZ3h20cZcdXGULXND6HzyzXYZh7eEsbJl2lwpy6+UCLJotASnagAstFt0PuKknwPL0PPUGrsLg5wi+Yx1q4lS1f1dVYY808og5HUPp+VqSuW5xetRn1iPKhev7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768873041; c=relaxed/simple;
	bh=6foIMWkM39YpRsrHkcMuBplG96nIcvxZ8pyBc0baPBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2xIVMItIPYIydpKeP3MgWIfdLGsxMsUSv91qd2c75o+xdY12fH77Do/0SZPXKZTwjtrGFezuZjI2voN4MoP2pGvN2vDm+QxqvVwyUtKUbhQKFwwiOcQHjA19ckHXnPLAIH8Wkri7QDe/iNps3ynYKnRcmMxrSgwmOn0DcnYmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK8WbdP+; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK8WbdP+"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12336c0a8b6so10342071c88.1
        for <sophgo@lists.linux.dev>; Mon, 19 Jan 2026 17:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873039; x=1769477839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=aK8WbdP++ytO/7IxD3zXJmt4avO1QmTs/43NC7jvivmRc7zXQkfCNK7EQsugJa1UtO
         65GdceF1z4oAWR5EYhVyFWTbeTB1GLEGGjg5WEr64m9pTPcwc8MvjG/N8Pbg+U0B7lte
         Bpjl3j3FsR5dPn2xvHKXN0YJQcL17CMzALJCJsoM628n9LoPgE3c0QnJM5zl03SuewRH
         ytAWePijExqy9zkkFTSUVvdq7bLCr62hD1Es54/s5OKn8Am1oSDFIR3EcN9S/PLj4JgL
         ATrf2UyiKylG5/jMkr3WLXu5TuvepfSw7h0vI7dswQj8sL1LGaU5K4wZDWaM8FMYjqZo
         oVXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873039; x=1769477839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=DEVKwPM0WxCRcDTYi1RyOiUFM+cLl8AxtVilpuC5E6BBJMqnEaSo5dTXVn6Gey/FD/
         NcWsgjsubDk7eDlOsTgRPVYp1oowO+1T92VxRxVYF1S0gOyileWMh4DxdYdWjvviW78k
         TEnhonx3bsFqotQXM1UzJSsGgSxGZ1/j9fwQxgRKmxZDwNP2/4X+q8kAPjWIwcwfO30L
         /iUi29q4UOD14mdVJ5Y8Q3zM2Q/OGWfon08l9HlCUr4Xz9Tebast4t8TFmfMWj+Br2SX
         ui5ZKwf4R0p4tp106Y5p61XjaC73VUXMhaArIBl11podjSd7E/xuAsNcpbIjrk70HNX7
         tyjg==
X-Forwarded-Encrypted: i=1; AJvYcCXDV52YU6xOXp+vfHkats6O5XrqAxYqj0mZpxjjWXkRxQBI9vDF8ld0Sp+42Ieyl+JLwzyHncs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjA9rO9N0tiCt0sZmgB+MZOtUq4he1VXrstFoawkF7Iolju4Ze
	aPz6K7YuMc8mio9CY/awN+VEzn0ShuG0758bsX7RMenT0ZieK1NnnVrC
X-Gm-Gg: AY/fxX68+fhWad59aHtLkmzyR8IacmHg4r+K/5IhkdGe55ELZD/ih8vpBykkXniwtPv
	nhyYe/MF4WWmjRXBKhQorL6QYSOXnGHfx0zfWBn3J6fy6/xUR2A6arZHcjwM2a9pTK4GZZZduQs
	0IYE4mGbxHjT4wdTObyndTNplndmSu1PgEIL9W1FH6NXm8CI8XF/Y/2zcZGzFS7SLqq+9/pKBoG
	HgBTZ9SwMvUdIGP8gCgyglVsYZDI7M29Cm1GGd1THJ8bnql9HpXv2WkWjk/Y/5daxRGrIyUFdzR
	PypqwqmdBz7eXSMPjA3+0EzeoqX8FiPVk+ZQ0nRaI1GbproUKW/ivmdOqPXcLeAsHLQHdY4Bblj
	NRnzsBOOSwXuN1xLyxhGFWW8XuehHyQZ4mNEHBRzaDzzdsJLCjXtW/xFfp2uVNDd+1m+RycHFuy
	VhjxBUxBXg6Q==
X-Received: by 2002:a05:7022:e03:b0:119:e569:fb91 with SMTP id a92af1059eb24-1244a6592d5mr11730336c88.0.1768873039305;
        Mon, 19 Jan 2026 17:37:19 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm18690198c88.16.2026.01.19.17.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:18 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Tue, 20 Jan 2026 09:37:03 +0800
Message-ID: <20260120013706.436742-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120013706.436742-1-inochiama@gmail.com>
References: <20260120013706.436742-1-inochiama@gmail.com>
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

