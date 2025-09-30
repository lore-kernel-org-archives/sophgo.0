Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839B2638BF
	for <sophgo@lists.linux.dev>; Tue, 30 Sep 2025 05:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759208612; cv=none; b=b1hbVDMOQO+ulFnEe2o5wBHt9J8bGw7cnYrpSQVDIPo3MaEgjfSI4ctI13tv2JSaw9GjoBiGIjsW1bBxQOn+Ee/oD/bZ611eXyL5frNANEddPmhpjYtepkjMnBUT52Chtkx/x3g82PMt4t8lkfXbthtPTFbyFEYF883a0soQ0jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759208612; c=relaxed/simple;
	bh=/rtni81NLg6R/7V1kv9Fo73Xzse+sErQ2+dI6TO4UQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lDFsrszscz0M3E2Bvbit5QPkAHowBC2BID7C9pYAx+ATNrDdps/DxPuq6/21O2o0VtFp0bFGTzIcfqI5DCZMWV1UbZYsc/5iMyjgWKudJuRGSck6bVK4h2aWMkiljgs3rBSXPu/0N+ukHWme23c0qEqUnlDdfay0pt4En390pw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps1Q+kWs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps1Q+kWs"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3ee130237a8so3893470f8f.0
        for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 22:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759208609; x=1759813409; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tDHiBgvlZKMDqbJ9iVvhp12FH415WcyIkEC0U6JcOUY=;
        b=Ps1Q+kWsJe0sWl2L+L/wazM0fdzQkKKGpnNKzNw9TTets3bX11/0geg4kGEmT51Yr9
         aSQ1gRuxfvYJd9VsFdzUn8zPgEhnHCrCP6f6ZPzk+C5O9DVHiabxjHX1C6GqzYNiegy8
         wCdu4XE0LPaEkgqo9wq001ZmZS86RYhGrYZVq60nXdO8M4lpOz3vC+ZOWBIUtnoa+0/n
         QhOPIu8j57Y3b3iNioARO5dqxe7rHkx34MxzrHIJe7BhqJsuT7m4TlpghQlVrpB5YZ7k
         0FhKiuEaaaFVE8Q8bh61+WHKeYbKD3r3hEW84teKhPw9O8PVa8PYCuhgNWkcwjMcqwBs
         19YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759208609; x=1759813409;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDHiBgvlZKMDqbJ9iVvhp12FH415WcyIkEC0U6JcOUY=;
        b=kMjuN1xmgcW4IXqYpJyoBzzINSTa6FPoqugmBKEtodz+FSsGYxtlKxSdoiI8o5RY51
         CMmHAnz7V1QcvCB4E/ppxqyRpWS9uQ728Wpv7hOR83JhxK9VZM8LEZcQyTCHkQ0pKEJx
         N/VLJ6cCKsBzkLPrOjqMcaVX31mc28beFj1eSaTNRAl96NzVAG+S3rhhTxQSfFOiPVss
         DV55z9HElRMvo97R4A0T6dbT/Og9L2LgHTNEsLpnOKxO0EZRM78DPaDXe0ffXNyc2uzS
         avHVRwfT6z6binQDvmCbtKm9LQYqOJsknpK6FbfvuLc5+cHw72z/xoJWNAmx0OYRClIJ
         FlyA==
X-Forwarded-Encrypted: i=1; AJvYcCW0GAkzgFfO239LFrxhMm87TUZG+BLUqIk6SEoRdIVSyMnmP+WUsGt7fZoTuj1L3UprlTYwxaI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZTr501wO7TF6dBBlBUs4OT1szaRyK5Gd/kNE8rw+7iwael3Ra
	mPUbBZ7xxaDL/I754Gi6s8QZkFY4b4h2JDzKFh70W3t57dix04unuYKW
X-Gm-Gg: ASbGncupQhu6LHL7mSIiIi6g+Fztpi30tRoBl+A4LBBu2dcBfs90UB2r5F8Jcmp/zrh
	I7WfOCGFsGtkZ6HLldkkxnqXlNZbHZZ7LVGfkHU7eJL1eSuW+dtXZxCkUHZHwU77tIULw4/ILse
	n9ZexV6bSxo1iRMeS3JQufCbkEpmcSgFX6AscNZYbiy3Em0ng7u/CSzlm500f2K12n0P18z9FpC
	S7W6FQs2nmTROG6/qBYAY6aoeFc+gX2pZGZtpQDOnNk7QUTUOtx5UEPw9I+oh7Hr/i2MKKxjZJe
	UiEg6nyaGTeOlTmVvjZdAZkyHUvMdVNMWQs0JU50VzviRVdMSwppazqLuElqFmjfvRK2YAYbXlo
	o7Qda3jL+BTp786WL0WYjtxg11wIRqvdmDIbPT9Xg6JeYw3qQwQcnrziQAR2xqDu5b9CxMq9Pg1
	ENig==
X-Google-Smtp-Source: AGHT+IEqNXnG5AV0ehUmkE/8d34Mg5uF9Su14lUDdR+mcFSm+TA7IIv1Oj266kEd4QYdX03XSq9P0w==
X-Received: by 2002:adf:a3c9:0:b0:410:3a4f:12c8 with SMTP id ffacd0b85a97d-4103a4f171dmr12364968f8f.20.1759208609024;
        Mon, 29 Sep 2025 22:03:29 -0700 (PDT)
Received: from giga-mm-2.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb711sm20710267f8f.11.2025.09.29.22.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 22:03:28 -0700 (PDT)
Message-ID: <ad86009bff38ddae0b291d3edbf958ce6363ece2.camel@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Joshua Milas
 <josh.milas@gmail.com>, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, unicorn_wang@outlook.com, 	rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
Date: Tue, 30 Sep 2025 07:03:24 +0200
In-Reply-To: <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
References: <20250927173619.89768-1-josh.milas@gmail.com>
	 <20250927173619.89768-3-josh.milas@gmail.com>
	 <nkzpfylhxyqf5u3bjlokhe4udgcxohbaanhwuofjzatan3iwio@45ljfquf5sui>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.0 
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Inochi, Joshua,

On Tue, 2025-09-30 at 07:54 +0800, Inochi Amaoto wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -0,0 +1,88 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> > +#include "sg2000.dtsi"
> > +
> > +/ {
> > +	model =3D "Milk-V DuoS";
> > +	compatible =3D "milkv,duo-s", "sophgo,sg2000";
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +		mmc0 =3D &sdhci0;
> > +	};
>=20
> It is better for adding gpio and other serial there?

I believe, gpio is long time discouraged here.

Link: https://lore.kernel.org/all/CACRpkdYErJH5RUjL+jPC5vnaqGiOqBwHsr0E42wO=
WrpBGrpS3w@mail.gmail.com/

--=20
Alexander Sverdlin.
