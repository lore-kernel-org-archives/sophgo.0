Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE94284678
	for <sophgo@lists.linux.dev>; Tue, 26 Aug 2025 01:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756170621; cv=none; b=pBobEjzln0I+YTRJE6TY9iUlBQvzAywdAkbJu5PENXEe2ZND3xDpY1VReGjRiXgAHRYgEpi7uCqJolmehKzmfGiVs44PSZCJykX97yamR7py6Yre4uq8k7LoBo0sEocLnEu/Ul1bwEj+0tFhQVOEIcQ5vXu+3j9Yoia+k6ZeRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756170621; c=relaxed/simple;
	bh=BhPG4H+I7zDs8dwab76+BoAR+ozvEKZSdpitJSyJUkw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WRlFLobthaiCEBOAOtGvjuJ5jqLnUHKz3iaGL27w7Oedj4WCPVT8h6seMqrv6QmYlS+kNIHQd11Z0hjRaGobCF3sPtz6cxC7h7F2As3Asuq0R0tBMkGZwITHqkcb24L80KiXb24HCbL/976M7XNtDh5n5Ps9XjeiRQAq+bn9yEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApOoIHcT; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApOoIHcT"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-435de8160dbso1536720b6e.3
        for <sophgo@lists.linux.dev>; Mon, 25 Aug 2025 18:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756170618; x=1756775418; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=ApOoIHcTxSaxsPnLmjMUcT+J8NJbf9hTvIVC62Pp8It9lmU6ZZ8k6DekrscsCQ3/Jy
         wWfeHZA8qvO9MGYzgavfavWhQyEqG6SYuAC0iTpO6B6Brq8UVNjy8e8iQvI8MPFfsPGJ
         7RwpUPqSdpHYHy1yTZeV2IXIgSsR67/H23+f9rd9mO3WY8H8HACOCUoMdH5uSFYxuse0
         XZVpn0v5GiCGjjSaCjVbDKqeM4YHRPOttzZnRAi12FkpkSylS7ty9KWtu5K2Sw66P7Mq
         0ZLU9jfcSRhzIqvMXOcdiT2oujVyJoj1NJZs2NSwcvm3ebQn0Yb54Dax+H8ERuoSXlSV
         rPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756170618; x=1756775418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/Iq+sl3J+lnpf+wc6OQRiTYktTo8qUO7r+bK6zwUBU=;
        b=fcY9dHgDIRsmHxwj7un5msma/lSPh0aHTiTjcN1pW7R6V8mzQya7IdW+tWXDSlk2/P
         pJRlAypDqoLuNYJGj7poe/2aFxMkpDNUM+i7+TBm1pQKsjv4lJWBlAGMoCwn6a6RVe+P
         2NzU4QqzV7YM06Hnx3YeLqKlNMBIUzTOqscxfkWx9J2hzcQC3YsAZNGUgp1AKnPCX+us
         6mfAmxLXCj+pT9uISe8NEctvQ5lrggjES4cVBXL65/f+YsTXseW6UiTf21QgBi0FMWFD
         Qxf7UWiQjv0fo67E3AAOIPWTpjLL5F453uGPo2N4J7gsMMMgW4mwPqQ6FOyKjY9y1GwE
         Pf0A==
X-Forwarded-Encrypted: i=1; AJvYcCUYEz9vy5bXomT/+69tgWRSYfd3/0rGYfpR6bXlB7l8QTy0cG2ZMGfZjDk1ubCbQAaZ8gX1ZkE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAVPqeSLJWS24MuugbgMdoXZsjjB5dGFtb5IU60Gpg/6WTUf7K
	A77AnvF0b4Jl9iyhoLt9L3htnS/UySTSUhRyhMa2Q30sR7aVc7hsBA8z
X-Gm-Gg: ASbGncu4fv08SsDMoNi66kj/lyrFf+wGkXGFXRlVpp48+XuQ4rxi6qGrJ/aVv6WI9D/
	tNQaHy3XTfYjq8VOMYc6Rk92PcFLXuHhL+SITPH2LjpUoD+EiSJdCPxqcelIQX/Ts8O9t6IqAFE
	C1wrzSrEVqZI4GVVgCt0PLkiGQLoaqO1Z4LB+D5mIZueXQp6kip7YrML3hYc13GL1LnVAy5n5dh
	tvgBS+k/VUZnU4a0Cch56LIlSne90TWLmJzVh16AFnuMXELYFEjnzMunQlWd6qGjN+4T4wEEW8C
	NGcHbJRWxj5cGx8KMrZV0Vf5JFDIkcno5uwcdYAwZA1PZHeXgG8vYhdjzMQeukN2wGBGNQ3JOlq
	BkKUqY7S7478N4QWt03y7HHpYl+HmfhFa
X-Google-Smtp-Source: AGHT+IElnibKn0kJO+4EjW9DXM+SobqgRQIgDWBiXTLfJjdn8m2ppBqLQoVrT6kVdtQvj76aRcVJlg==
X-Received: by 2002:a05:6808:179a:b0:437:761b:dcd with SMTP id 5614622812f47-437852ad33fmr7337517b6e.44.1756170617942;
        Mon, 25 Aug 2025 18:10:17 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437963db10bsm1352616b6e.0.2025.08.25.18.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 18:10:17 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH v2 3/3] riscv: sophgo: dts: sg2044: change msi irq type to IRQ_TYPE_EDGE_RISING
Date: Tue, 26 Aug 2025 09:10:10 +0800
Message-Id: <579f5bc7d060701cbab1046c3b55ca0bec15eff5.1756169460.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Wang <unicorn_wang@outlook.com>

The latest MSI driver will read the DTS configuration to set the IRQ type,
so correct the IRQ type in the DTS to the correct value.

This field in the DTS was not used before.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index 6ec955744b0c..320c4d1d08e6 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -214,7 +214,7 @@ msi: msi-controller@6d50000000 {
 			reg-names = "clr", "doorbell";
 			#msi-cells = <0>;
 			msi-controller;
-			msi-ranges = <&intc 352 IRQ_TYPE_LEVEL_HIGH 512>;
+			msi-ranges = <&intc 352 IRQ_TYPE_EDGE_RISING 512>;
 			status = "disabled";
 		};
 
-- 
2.34.1

