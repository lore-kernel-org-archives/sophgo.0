Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AC921ABBB
	for <sophgo@lists.linux.dev>; Wed, 29 Jul 2026 01:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289716; cv=none; b=Cg4XzR9eJKJ7bjmrZgCAbyIQWRJjacum3F2jgn14UIKYViWOzNmywhD3Parb3f8J1WOTLkaV4VectB9Uqeo/6Xi2aD3BWvQKkh9vYcoOg93LaYhuzKYWrT5TJLhNno0sKZZxqwnlDKbkZjG7JRkBx0hJUZ+cbS9varf2CPZIfSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289716; c=relaxed/simple;
	bh=hkS3fpJJGFq5pnP1DWaVGxQA4OwEvU2qy5Rss0XWaCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MrZAsBwZFagFB+uSCnpWWP1SI62H6RTWDMT/r6yy0/zqtrE83ZTwUDDw5Y6H8FHdzLyxI+LTC8ZAGR5fGMXgU9W3DIvvlqvrC7QVt4wO0apX01+SK2408zUtG06HKtY+0ZdvD57Aw7/6HoKymtq5mSTriKB6awMYDC2T0dkVkKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FruQBlEd; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FruQBlEd"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8485b358552so475506b3a.2
        for <sophgo@lists.linux.dev>; Tue, 28 Jul 2026 18:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785289715; x=1785894515; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J8VS8ZB1guuCz2FDTf2FUiR3jOA+ZzoXLBMbwtZp+5A=;
        b=FruQBlEdqz0dSKs7B7jFdw+pEgV4h8XVJhsOF5d2o4FcYib7h1tIf27CrN7rD7sXwx
         6T3v4kgZHmmC030F2PkvWUdiPn/l9dWOyjZMlTfmph8UeCRh2TXTMuyEY1HGucXsmuAI
         RN6awh9mXtrSGINdX4tUnAB5KOXVQiHq8xijYY2+J82lJKdbhYxU+LA9oKW2Sp97YUwb
         kY2gb8UjoL2lQvyYEY65rUUrjyBLU2UdQJZWSppYhxwGBvAtzgty+IDJHaPkcnphGW3e
         JotrxT05VjDp55F81ABxei7Nlq9DTAOvjz+Srf8WcZ6XD16MStqcSl9KTC5aK+BHPCS4
         cakg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289715; x=1785894515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J8VS8ZB1guuCz2FDTf2FUiR3jOA+ZzoXLBMbwtZp+5A=;
        b=sji+e9zX215SYGC1pl9BeDFgoXVcPBZrhmhaazGO4urAvn/SapNaWfmFeYe/r4q4BD
         fKLqv/M67/YWV0UUbuXb3xRqjAvwH3MvGq4V7WvKKJc6gtc08ds0YmNwFvCXQ6bSSE1C
         uDB+Zk3BUnyjDW6yEdzuSHy29RIbH963IVvB4yf6tK7Dr0aOHb6D744mI3GZCZvnZRO/
         9/dVm1P0ivt79yTs3VVgotiAq4ZuPG4SAaLdyrZhnhdJSCtBE3BhnFg7lPLeMvkhziK1
         gOphDmfO4fUGV/VinQ/T9uvknbJeGZDFFyGq26F5Ke7ah0Z5cUz4Xhc9+yYEQpwpunUI
         5buA==
X-Forwarded-Encrypted: i=1; AHgh+RrxQyyLfJpe42S0pJUzxw1jZmwcl4t5aATX1A8+cRl5Ek1lCoZaKBfyJ+Cr7FjjdJKNV4NCS0M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy46piWGTnMp64fjblw9zU9POP+LyYLD+MbGDexWOSndRmYz2sK
	FgcjJGrfUWKCdyeT1HqiRVQMWC5GHc9ri+Pnai39/B0UPB9dV/MuZ2zx
X-Gm-Gg: AR+sD10R3ftlIBNOfeaIiikZ6l2WJ2PWG/R4E+IOkkiBQVKYdxeilUxCjaXu0SSxNki
	8RbnhjlIBXWb6QgocwaKfsAcYkQZvOa0z81/abyvU5ZR9vEkhxGJW2ChWZK6j9CmNo4j1oSP9zG
	Uxr3Bxm7afEdrbvxmA1kE1KlkQJK+fjbiimQsGn9UNphwu2Pf/1XirPJA9rF5rlptAsv/TH2x+I
	7/N9ThEGnoSFFWI1CbKoZygbyRXPtADAsC8vKruJ60rQFC7pkC5AmIk4kwYhGvH0kmYZOVtDy6r
	bJXmayiBPVfwof+dz1t/ZLYTIKQAB5Pra1Wl6xy+qU+9ECmQEv/JYVazv+A8FRjYX74VeKpAxRg
	i+xlxNLMk7ocn8lpUSprOM3W8lzyk9nbCiCEL16FJWMonFm6IaNnB+Z/J0XeYtk9Nr5NLyfzDmd
	CVr2cjh94Z0sYJpjOV9WCus3PQTvE5cW43/kMOEqQr3JyRXPCONF1TsVMYTj4=
X-Received: by 2002:a05:6a00:4fc2:b0:846:8b21:6304 with SMTP id d2e1a72fcca58-84e9311de36mr5193587b3a.14.1785289714696;
        Tue, 28 Jul 2026 18:48:34 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3c5dsm590510b3a.57.2026.07.28.18.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:48:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com,
	Alexander Sverdlin <alex@sverdlin.org>,
	Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Wed, 29 Jul 2026 09:48:20 +0800
Message-ID: <178528968141.162041.7895894684986779851.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 15 Jun 2026 08:03:21 -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking
> from ethernet, enumerate the wifi chip, have bluetooth, and can
> read a I2C slave device over i2c4.
> 
> [...]

Applied to dt/arm, thanks!

[1/3] arm64: dts: sophgo: add initial Milk-V Duo S board support
      https://github.com/sophgo/linux/commit/fd2544c8cffa6a53ef8faeedbf9a66a171de0fcc

Thanks,
Inochi

