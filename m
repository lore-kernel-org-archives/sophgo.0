Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC3F387362
	for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782757328; cv=pass; b=doz7KaWSLooSFtxGiLeHE5T6aHm8CZoMPEdYp9qvK/e5z8Y9+oWzeCmFWvb14KKoMp0HNvDiknXQ9tW8qdx+s2G5Oy6kx1Pyyyoll7NBeZdRXnsmN7KlQ86iBKA8Tr2Whk4JpHv3KK5XWgGoiogr1OH3yFo//hb9sm2lwjyTw5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782757328; c=relaxed/simple;
	bh=rTCC+Q2QI/RNZdcYErq5nB4Tg1Xxg7Ybj1fhnVetaOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iRLtq7dFHYBY19chKZ0YbFbB0XSH06yvmYWEzTtRhWQAmM7q0uf5g3T9s3v8P/z+NTFDP6KKXLPGR8LYzm+tZoyYazZPyLO40+7T120lqC7c7aX5BEy/qWhvk/sMmoLNkS6CGleSku5TMzuZ2aUEMZ5rmA1EGnZGuXsj9A2a9fQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g8aoGEMW; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g8aoGEMW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-463f1165e16so3694747f8f.0
        for <sophgo@lists.linux.dev>; Mon, 29 Jun 2026 11:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782757321; cv=none;
        d=google.com; s=arc-20260327;
        b=bdZGdiCNVw+NXaVyW8ajiHfh4UEW5di6tn6pn2HjHBgiDxjZ+30g5DcnWFkqI63Dv0
         Ss7BgB/1vuqzPJBu57Y19uiz93w+KNvgTinJPZ1ycW7UqXz1Vj8xifK2mFSjzja4vRBz
         fqFJ3EHnP4YapFGrBohXFCAraZ5o/9eeiNlWhmoziqVS2UwqURhBHyVaHJPLw/koT/wf
         0DIg4iY1T2IgO1YskOmCATDnaLNfIULq5/zoQTBy7tXyRH6iMeVobHPHv6L569nxn3ia
         6K39TVOOoxyMEY8dj57z1SAosBJR3FGPENZdXZ+XOEQ4Ua0FHCoz63Z9c1PMTwnjGQiz
         /N3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5NfKOjNU6srylE75C2adpej95bKtXYvziT0LYJSnVds=;
        fh=+g+woS6ev/whRjnxvNn3FBI3beST+lKtWMfFQgtNGck=;
        b=knsUCtyKrzW5jc6+IVYOxVWNPu2R7pN18vHniQHE5M/7BNnev3rwwE0QfvpYkDef/5
         Z+52sun5JdyWHHdXLIniQylli5AJyiBbHRg7KQ8GjQ3H1IZgNy/TlkOjfcomQ1T3/oya
         MpcM8uOtQgzsE+WdkdZX389hM9Vv/BfcpEZw+dbNKkQ+qbpoujD9aoyqCdj5UhV9UzrW
         U4gqtdVtrjryaCsshjBQDVQzeV44qZKTB6rqBDCxjRJPA5voKM8iGRsLxp2ljdCX/h/0
         Q/mGBFuori1xlSQygSFzaTssbWwiR2AFzDDzQWVILd7WEVZO7AXbZJDLG1Tapr0M042u
         tqCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782757321; x=1783362121; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5NfKOjNU6srylE75C2adpej95bKtXYvziT0LYJSnVds=;
        b=g8aoGEMWfP9m792yBDuB13vYjhEr0mhbZRA229M4/xxLmAgwQnrxcmNDG92cQ1TIiX
         FbHBOvHMBjXQBtS8kkIMEJj16hEGDuNDdY5NvOoBfS3cJe1jMURWHcxJJVbvTKD5L6n8
         WF0zFQgB5T/IBWJaiPMR4rvq+AlLZLAVic5SBYQrI7O1IgE9/H2SQLeMux+sNh6zP7j8
         KRapbLenFGXFTgCiOdebk1mDkikQq5bwB1ANSWx+s716Z2lTxolug1e2BWrqF2FHjeie
         8S/ZPKBprmVsqbjKcBMMNRW5C2xQ+9fBws7vAZ5qa96TjJTUafMV5/+uJ7CTtZ+A+Bi/
         KdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782757321; x=1783362121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NfKOjNU6srylE75C2adpej95bKtXYvziT0LYJSnVds=;
        b=YRYes9pvMdF++C8OzlIPBEDnV9dcn6jBERTbTN4O6jvKPT3XnXRF0FzFXbPS/pXaOW
         Ko6AonkFBWHu097QtLc8fJyh447SfWMzu2TEr3xqIiuF0C+72v9Gc1BkUI9FLpw5Q6bP
         LQIdZqV3pEDvyOYkXG+/QTTBiJxjUyn7IsCByHEn0abl+xTyDyxhQXEDy7pR+jAnOE8F
         SDAVAxQDo5faKu0zPyVyAV3DehGVOiNWn24A4wKLrCPM+ooBKfg9juTEHLmmVIMZqNy+
         ohjam8WTgB8llBl+I8vp2u+fUQlma/nkEt/tu4dCzG3wxYc0wahVNcWdOFpBP7/jw/IP
         Xkqw==
X-Forwarded-Encrypted: i=1; AHgh+RrfEVWPJCreZWGUzSj+S/r1Vqgrry26PLpwI9yeqZR+bxfHfHlM9O1u3vDyHud82jo0+OriFm8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxM2HCeLD4Y65TJ6ySPu2CHDE/IMqbFKweKZatt/5AcmOa3Y+zi
	+7m62h0IfNp2aFHBVK/LmUCFj0mr3vY0dhm8UarEOn0EC2NHcMFiBqnT+mUJ0QK4MTPStuhZi+i
	ux1PB4+xkvRRZlpjF/EWq1qZJ2kaUX3o=
X-Gm-Gg: AfdE7ckIz11gerc99Tw7ev9ztQ2C8FJKfETu+PUq8/p4gUrfaWgnD7wsNkA5B+Y9fBa
	XcBMMLiSOlyqYqJM+aqng9LrSL/DPpir4p3ckaJvgIVhIqLVktlG6/ZSbU/DO0FY3HeTTGPUlxA
	wgnitk5EQbilVGVQ196fuHNxYWXr1lTmKI8YmBcHPt2TQy8t/8f/GSPm1rtrbklixLCw/6oFver
	/ZpgzfNeWWKdF2zLxy8XuWlzvbFsQXWel+r3TOKyZaCXVehbSTd3gKlcw80Mvv9sLDQNqFj2CL+
	NC8dFlIlRx3OPhgR9lTDnjgCotbmQA==
X-Received: by 2002:a05:6000:460d:b0:473:6e8d:7f3 with SMTP id
 ffacd0b85a97d-475506e96a8mr558778f8f.1.1782757321163; Mon, 29 Jun 2026
 11:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com> <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-6-3f01a2449488@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 29 Jun 2026 14:21:24 -0400
X-Gm-Features: AVVi8CeVJe5kDV9ivsXrbK-CzxJfU-Om1AQNkB7-XLVhzZDb1etpOuW05CkKE0c
Message-ID: <CAJFTR8RK2sR88ePKREmZw-9FRkWEpV_FH6s7M9TegaObqU1cwA@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 4:14=E2=80=AFPM Guodong Xu <docular.xu@gmail.com> w=
rote:
>
> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
>
> Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
> parsed from devicetree/ACPI ISA strings. Ziccrse is already present
> in cpufeature; this patch only adds its hwprobe exposure.
>
> Expose all four extensions via hwprobe through new bits in
> RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
> _ZICCRSE, _ZA64RS), so userspace can probe each of these
> RVA23U64-mandatory extensions individually.
>
> Rationale for the validation dependencies added for Ziccamoa and Za64rs:
>
> 1) Ziccamoa depends on Zaamo.  The RVA23 profile prose was updated
> post-ratification to spell out the Zaamo reference: commit
> 2b218613752d in riscv/riscv-profiles ("Improve description of
> Ziccamoa (#224)") reworded the rva23-profile.adoc (and other profiles
> that include Ziccamoa) text from "must support all atomics in A" to
> "must support all atomics in the Zaamo extension" [1].
>
> 2) Za64rs depends on Zalrsc. The unprivileged ISA manual src/zars.adoc,
> integrated in commit ebe06adc22cd ("Integrate profiles as Volume III
> (#2771)"), defines Za64rs as: "The Za64rs extension requires that the
> reservation sets used by the instructions in the Zalrsc extension be
> contiguous, naturally aligned, and at most 64 bytes in size" [2].
>
> Link: https://github.com/riscv/riscv-profiles/commit/2b218613752d63287286=
b5ae801b820cbd8cc10c [1]
> Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/unpriv/zars=
.adoc [2]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

> ---
> v4: No change.
> v3: Indent the added hwprobe.rst entries to match the normalized style; n=
o other change.
> v2:
> - Rebased to v7.1-rc2.
> - Reworded subject and expanded commit message.
> - Validation added for Ziccamoa depending on Zaamo and Za64rs depending
>   on Zalrsc.
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
>  arch/riscv/include/asm/hwcap.h        |  3 +++
>  arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
>  arch/riscv/kernel/cpufeature.c        | 21 +++++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
>  5 files changed, 48 insertions(+)
>
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 49d9fb68632d0..893e1a1215d23 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -405,3 +405,19 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is suppo=
rted,
>      as defined in the RISC-V Profiles specification starting from commit
>      b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is sup=
ported,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is support=
ed,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is suppo=
rted,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> +
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is support=
ed,
> +    as defined in the RISC-V Profiles specification starting from commit
> +    b1d80660 ("Updated to ratified state.")
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index e8f4a7dd96a93..0acb7a01ecc0f 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -113,6 +113,9 @@
>  #define RISCV_ISA_EXT_ZICFILP          104
>  #define RISCV_ISA_EXT_ZICFISS          105
>  #define RISCV_ISA_EXT_ZICCLSM          106
> +#define RISCV_ISA_EXT_ZICCAMOA         107
> +#define RISCV_ISA_EXT_ZICCIF           108
> +#define RISCV_ISA_EXT_ZA64RS           109
>
>  #define RISCV_ISA_EXT_XLINUXENVCFG     127
>
> diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/u=
api/asm/hwprobe.h
> index 6819df159c51e..58d1e86e47ae7 100644
> --- a/arch/riscv/include/uapi/asm/hwprobe.h
> +++ b/arch/riscv/include/uapi/asm/hwprobe.h
> @@ -117,6 +117,10 @@ struct riscv_hwprobe {
>  #define RISCV_HWPROBE_KEY_IMA_EXT_1            16
>  #define                RISCV_HWPROBE_EXT_ZICFISS       (1ULL << 0)
>  #define                RISCV_HWPROBE_EXT_ZICCLSM       (1ULL << 1)
> +#define                RISCV_HWPROBE_EXT_ZICCAMOA      (1ULL << 2)
> +#define                RISCV_HWPROBE_EXT_ZICCIF        (1ULL << 3)
> +#define                RISCV_HWPROBE_EXT_ZICCRSE       (1ULL << 4)
> +#define                RISCV_HWPROBE_EXT_ZA64RS        (1ULL << 5)
>
>  /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 1fb595581adcf..b9538e69fa1b3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -90,6 +90,24 @@ static int riscv_ext_f_depends(const struct riscv_isa_=
ext_data *data,
>         return -EPROBE_DEFER;
>  }
>
> +static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data=
,
> +                                  const unsigned long *isa_bitmap)
> +{
> +       if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAA=
MO))
> +               return 0;
> +
> +       return -EPROBE_DEFER;
> +}
> +
> +static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *dat=
a,
> +                                   const unsigned long *isa_bitmap)
> +{
> +       if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAL=
RSC))
> +               return 0;
> +
> +       return -EPROBE_DEFER;
> +}
> +
>  static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *da=
ta,
>                                      const unsigned long *isa_bitmap)
>  {
> @@ -502,6 +520,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
>         __RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv=
_ext_zicbop_validate),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, r=
iscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
> +       __RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, r=
iscv_ext_zaamo_depends),
> +       __RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
>         __RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
>         __RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
>         __RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP,=
 riscv_xlinuxenvcfg_exts,
> @@ -516,6 +536,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>         __RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
>         __RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
> +       __RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv=
_ext_zalrsc_depends),
>         __RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
>         __RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
>         __RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 9cf62266f1890..b15ac9adf7920 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -206,6 +206,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *p=
air,
>                  */
>                 EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
>                 EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
> +               EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
>         }
>
>         /* Now turn off reporting features if any CPU is missing it. */
>
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
